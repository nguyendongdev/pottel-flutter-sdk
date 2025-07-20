import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:skyfi_sdk/skyfi_sdk_config.dart';
import 'package:skyfi_sdk/utilities/common.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/text_styles.dart';
import 'paramTime.dart';
import 'socketService.dart';

class VideoCallViewJitsiScreen extends StatefulWidget {
  const VideoCallViewJitsiScreen(
      {super.key, required this.msisdn, required this.serial});

  final String msisdn;
  final String serial;

  @override
  State<VideoCallViewJitsiScreen> createState() =>
      _VideoCallViewJitsiScreenState();
}

class _VideoCallViewJitsiScreenState extends State<VideoCallViewJitsiScreen> {
  final _jitsiMeetPlugin = JitsiMeet();
  List<String> participants = [];

  String roomType = 'jitsi';
  final socketService = SocketService();
  String statusStatus = '';
  String roomId = '';
  String token = '';
  String tellerId = '';
  Timer? timerClear;
  // String linkVideoCall = dotenv.get('JITSI_MEET_URL');
  String linkVideoCall = SkyfiSdkConfig.baseUrlJitsi;
  late ParamTime paramTime = ParamTime();
  ParamTime? paramTimeSave;

  onClientEndCall(bool noPopScreen) {
    print("onClientEndCall: tellerId: $tellerId");

    socketService.emit('client-stop-call', {'id': tellerId});

    // Pass data về màn trước
    context.pop({
      "status": "client-end-call",
      "message": "Cuộc gọi đã kết thúc",
      "tellerId": tellerId
    });

    return;
  }

  join(String roomId, String token) async {
    var options = JitsiMeetConferenceOptions(
        serverURL: linkVideoCall,
        room: roomId,
        token: token,
        configOverrides: {
          //end_conference
          "end_conference": false,
          "startWithAudioMuted": false,
          "startWithVideoMuted": false,
          "subject": widget.msisdn.startsWith('84')
              ? widget.msisdn.replaceFirst('84', '0')
              : widget.msisdn,
        },
        featureFlags: {
          'prejoinpage.enabled': false, // Tự động vào phòng
          'welcomepage.enabled': false, // Bỏ qua trang chào
          'toolbox.alwaysVisible': true,
          'chat.enabled': false,
          'pip.enabled': false,
          'tile-view.enabled': true,
          'settings.enabled': false,
          'invite.enabled': false,
        });
    var listener = JitsiMeetEventListener(
      conferenceJoined: (url) {
        // debugPrint("conferenceJoined: url: $url");
        // connected time
        paramTime.connected = DateTime.now().toString();
      },
      conferenceTerminated: (url, error) {
        print("statusStatus in conferenceTerminated: $statusStatus");
        // debugPrint("socket url: ${socketService.toString()}, error: $error");
        if (statusStatus == 'start-call') {
          onClientEndCall(false);
        }
        if (statusStatus == 'register-result') {
          onClientEndCall(false);
        }
      },
      conferenceWillJoin: (url) {
        // debugPrint("conferenceWillJoin: url: $url");
      },
      participantJoined: (email, name, role, participantId) {
        // debugPrint(
        //   "participantJoined: email: $email, name: $name, role: $role, "
        //   "participantId: $participantId",
        // );
        participants.add(participantId!);
      },
      participantLeft: (participantId) {
        // debugPrint("participantLeft: participantId: $participantId");
      },
      audioMutedChanged: (muted) {
        // debugPrint("audioMutedChanged: isMuted: $muted");
      },
      videoMutedChanged: (muted) {
        // debugPrint("videoMutedChanged: isMuted: $muted");
      },
      endpointTextMessageReceived: (senderId, message) {
        // debugPrint(
        //     "endpointTextMessageReceived: senderId: $senderId, message: $message");
      },
      screenShareToggled: (participantId, sharing) {
        // debugPrint(
        //   "screenShareToggled: participantId: $participantId, "
        //   "isSharing: $sharing",
        // );
      },
      chatMessageReceived: (senderId, message, isPrivate, timestamp) {
        // debugPrint(
        //   "chatMessageReceived: senderId: $senderId, message: $message, "
        //   "isPrivate: $isPrivate, timestamp: $timestamp",
        // );
      },
      chatToggled: (isOpen) => debugPrint("chatToggled: isOpen: $isOpen"),
      participantsInfoRetrieved: (participantsInfo) {
        // debugPrint(
        //     "participantsInfoRetrieved: participantsInfo: $participantsInfo, ");
      },
      readyToClose: () {
        debugPrint("readyToClose");
        // socket status
      },
    );

    await _jitsiMeetPlugin.join(options, listener);
  }

  _eventAdminStopCall(data) {
    print("onAdminStopCall: $data");

    _jitsiMeetPlugin.hangUp();
    // Pass data về màn trước
    // context.pop({
    //   "status": "admin-stop-call",
    //   "message": "Cuộc gọi đã được tắt bởi admin",
    //   "data": {}
    // });

    Common.showToast('Cuộc gọi đã được tắt', context);
    //  Navigator.of(context).pop();
  }

  _eventRegisterResult(data) {
    print("onRegisterResult: $data");
    Common.showToast('Kết nối thành công ${data['phone']}', context);
    print(data);
    //  Navigator.of(context).pop();
  }

  _onStartVideoCall(data) {
    print("onStartVideoCall: $data");

    timerClear?.cancel();
    final dataMap = data as Map<String, dynamic>;
    var roomId = dataMap['roomId'];
    var token = dataMap['token'];
    var tellerId = dataMap['id'];
    print("roomId: $roomId");
    print("token: $token");
    print("tellerId: $tellerId");
    setState(() {
      tellerId = tellerId;
      statusStatus = 'start-call';
    });

    setState(() {
      roomId = roomId;
      token = token;
    });

    join(roomId, token);
    // connecting
  }

  _noFreeTeller(data) {
    print("onNoFreeTeller: $data");
    // delay 30s and pop screen
    // if unmout clear function
    if (mounted) {
      Future.delayed(const Duration(seconds: 5), () {
        Navigator.of(context).pop({
          "status": "no-free-teller",
          "message": "Rất tiếc, không có tổng đài viên nào đang rảnh, Bạn vui lòng bấm vào 'Quay video' để được hoản tất quá trình Đăng ký thông tin",
          "data": data
        });
      });
    }

    return;
  }

  _connectingTeller(data) {
    print("onConnectingTeller: $data");
    setState(() {
      statusStatus = 'connecting-teller';
    });

    // Pass data về màn trước
    // context.pop({
    //   "status": "connecting-teller",
    //   "message": "Đang kết nối với teller...",
    //   "data": data
    // });
  }

  _eventAdminRefuseCall(data) {
    print("onAdminRefuseCall: $data");
  }

  _eventAdminRequestSign(data) {
    print("onAdminRequestSign: $data");
  }

  _eventAdminRejectClientRegistration(data) {
    print("onAdminRejectClientRegistration: $data");
    _jitsiMeetPlugin.hangUp();
  }

  _adminStartRecording(data) {
    print("onAdminStartRecording: $data");
  }

  @override
  void dispose() {
    socketService.disconnect();
    _jitsiMeetPlugin.hangUp();
    super.dispose();
  }

  @override
  void initState() {
    socketService.connect();
    socketService.emit('client-start-call', {
      "telNumber": widget.msisdn,
      "serial": widget.serial,
      "roomType": "Jitsi",
    });

    socketService.on('admin-stop-call', _eventAdminStopCall);
    socketService.on('register-result', _eventRegisterResult);
    socketService.on('start-call', _onStartVideoCall);
    socketService.on('no-free-teller', _noFreeTeller);
    socketService.on('connecting-free-teller', _connectingTeller);
    socketService.on('admin-refuse-call', _eventAdminRefuseCall);
    socketService.on('admin-request-sign', _eventAdminRequestSign);
    socketService.on('admin-reject-client-registration',
        _eventAdminRejectClientRegistration);
    socketService.on('admin-start-recording', _adminStartRecording);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            gradient: AppColors.redGradient,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Image.asset(
                'assets/images/logo_skyfi_yellow.png',
                width: MediaQuery.of(context).size.width * 0.6,
                fit: BoxFit.contain,
                package: 'skyfi_sdk',
              ),
              const SizedBox(height: 20),
              Text(
                'Đang kết nối...',
                style: AppTextStyles.body.copyWith(
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 300),
              // Button Icon end call rounded background white
              IconButton(
                iconSize: 40,
                style: IconButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                onPressed: () {
                  onClientEndCall(true);
                },
                icon: const Icon(Icons.call, size: 32),
                color: AppColors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
