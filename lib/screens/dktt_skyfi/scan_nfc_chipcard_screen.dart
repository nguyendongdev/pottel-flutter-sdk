// Created by Crt Vavros, copyright © 2022 ZeroPass. All rights reserved.
// ignore_for_file: prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings

import 'dart:async';
import 'dart:io';

import 'package:dmrtd/dmrtd.dart';
import 'package:dmrtd/extensions.dart';
import 'package:dmrtd/src/proto/can_key.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:logging/logging.dart';
import 'package:skyfi_sdk/core/widgets/gradient_button.dart';
import 'package:skyfi_sdk/l10n/localization_extension.dart';
import 'package:skyfi_sdk/routers/routers.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../core/constants/colors.dart';
import '../../core/constants/spacing.dart';
import '../../core/constants/text_styles.dart';
import '../../core/widgets/snack_bar_app.dart';
import 'widgets/step_indicator.dart';

class MrtdData {
  EfCardAccess? cardAccess;
  EfCardSecurity? cardSecurity;
  EfCOM? com;
  EfSOD? sod;
  EfDG1? dg1;
  EfDG2? dg2;
  EfDG3? dg3;
  EfDG4? dg4;
  EfDG5? dg5;
  EfDG6? dg6;
  EfDG7? dg7;
  EfDG8? dg8;
  EfDG9? dg9;
  EfDG10? dg10;
  EfDG11? dg11;
  EfDG12? dg12;
  EfDG13? dg13;
  EfDG14? dg14;
  EfDG15? dg15;
  EfDG16? dg16;
  Uint8List? aaSig;
  bool? isPACE;
  bool? isDBA;
}

final Map<DgTag, String> dgTagToString = {
  EfDG1.TAG: 'EF.DG1',
  EfDG2.TAG: 'EF.DG2',
  EfDG3.TAG: 'EF.DG3',
  EfDG4.TAG: 'EF.DG4',
  EfDG5.TAG: 'EF.DG5',
  EfDG6.TAG: 'EF.DG6',
  EfDG7.TAG: 'EF.DG7',
  EfDG8.TAG: 'EF.DG8',
  EfDG9.TAG: 'EF.DG9',
  EfDG10.TAG: 'EF.DG10',
  EfDG11.TAG: 'EF.DG11',
  EfDG12.TAG: 'EF.DG12',
  EfDG13.TAG: 'EF.DG13',
  EfDG14.TAG: 'EF.DG14',
  EfDG15.TAG: 'EF.DG15',
  EfDG16.TAG: 'EF.DG16'
};

Widget _makeMrtdAccessDataWidget(
    {required String header,
    required String collapsedText,
    required bool isPACE,
    required bool isDBA}) {
  return ExpandablePanel(
      theme: const ExpandableThemeData(
        headerAlignment: ExpandablePanelHeaderAlignment.center,
        tapBodyToCollapse: true,
        hasIcon: true,
        iconColor: Colors.red,
      ),
      header: Text(header),
      collapsed: Text(collapsedText,
          softWrap: true, maxLines: 2, overflow: TextOverflow.ellipsis),
      expanded: Container(
          padding: const EdgeInsets.all(18),
          color: Color.fromARGB(255, 239, 239, 239),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Text(
              'Access protocol: ${isPACE ? "PACE" : "BAC"}',
              //style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'Access key type: ${isDBA ? "DBA" : "CAN"}',
              //style: TextStyle(fontSize: 16.0),
            )
          ])));
}

String formatEfCom(final EfCOM efCom) {
  var str = "version: ${efCom.version}\n"
      "unicode version: ${efCom.unicodeVersion}\n"
      "DG tags:";

  for (final t in efCom.dgTags) {
    try {
      str += " ${dgTagToString[t]!}";
    } catch (e) {
      str += " 0x${t.value.toRadixString(16)}";
    }
  }
  return str;
}

String formatMRZ(final MRZ mrz) {
  return "MRZ\n"
          "  version: ${mrz.version}\n" +
      "  doc code: ${mrz.documentCode}\n" +
      "  doc No.: ${mrz.documentNumber}\n" +
      "  country: ${mrz.country}\n" +
      "  nationality: ${mrz.nationality}\n" +
      "  name: ${mrz.firstName}\n" +
      "  surname: ${mrz.lastName}\n" +
      "  gender: ${mrz.gender}\n" +
      "  date of birth: ${DateFormat.yMd().format(mrz.dateOfBirth)}\n" +
      "  date of expiry: ${DateFormat.yMd().format(mrz.dateOfExpiry)}\n" +
      "  add. data: ${mrz.optionalData}\n" +
      "  add. data: ${mrz.optionalData2}";
}

String formatDG15(final EfDG15 dg15) {
  var str = "EF.DG15:\n"
      "  AAPublicKey\n"
      "    type: ";

  final rawSubPubKey = dg15.aaPublicKey.rawSubjectPublicKey();
  if (dg15.aaPublicKey.type == AAPublicKeyType.RSA) {
    final tvSubPubKey = TLV.fromBytes(rawSubPubKey);
    var rawSeq = tvSubPubKey.value;
    if (rawSeq[0] == 0x00) {
      rawSeq = rawSeq.sublist(1);
    }

    final tvKeySeq = TLV.fromBytes(rawSeq);
    final tvModule = TLV.decode(tvKeySeq.value);
    final tvExp = TLV.decode(tvKeySeq.value.sublist(tvModule.encodedLen));

    str += "RSA\n"
        "    exponent: ${tvExp.value.hex()}\n"
        "    modulus: ${tvModule.value.hex()}";
  } else {
    str += "EC\n    SubjectPublicKey: ${rawSubPubKey.hex()}";
  }
  return str;
}

String formatProgressMsg(String message, int percentProgress) {
  final p = (percentProgress / 20).round();
  final full = "🟢 " * p;
  final empty = "⚪️ " * (5 - p);
  return message + "\n\n" + full + empty;
}

class ScanNfcChipcardScreen extends StatefulWidget {
  ScanNfcChipcardScreen({
    super.key,
    required this.docNumber,
    required this.dob,
    required this.doe,
  });

  String docNumber;
  String dob;
  String doe;

  @override
  // ignore: library_private_types_in_public_api
  _ScanNfcChipcardScreenState createState() => _ScanNfcChipcardScreenState();
}

class _ScanNfcChipcardScreenState extends State<ScanNfcChipcardScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  var _alertMessage = "";
  final _log = Logger("mrtdeg.app");
  var _isNfcAvailable = false;
  var _isReading = false;

  late final TextEditingController _docNumber;
  late final TextEditingController _dob;
  late final TextEditingController _doe;
  late final TextEditingController _can;

  late bool _checkBoxPACE;

  MrtdData? _mrtdData;

  final NfcProvider _nfc = NfcProvider();

  // ignore: unused_field
  late Timer _timerStateUpdater;
  final _scrollController = ScrollController();
  late final TabController _tabController;

  late YoutubePlayerController _youtubeController;

  @override
  void initState() {
    super.initState();

    /**
     * Thêm observer để monitor app lifecycle
     * Chỉ áp dụng cho Android để không ảnh hưởng đến iOS
     * 
     * Mục đích: Theo dõi khi nào app ở foreground/background để debug
     * và đảm bảo NFC Foreground Dispatch hoạt động đúng
     */
    if (Platform.isAndroid) {
      WidgetsBinding.instance.addObserver(this);
      _log.info("Android: Đã thêm lifecycle observer cho NFC management");
    }

    // Initialize TextEditingControllers with widget parameters
    _docNumber = TextEditingController(text: widget.docNumber);
    _dob = TextEditingController(text: widget.dob);
    _doe = TextEditingController(text: widget.doe);
    _can = TextEditingController(
        text: widget.docNumber.substring(widget.docNumber.length - 6));

    // Initialize PACE checkbox with widget parameter
    _checkBoxPACE = false;

    _tabController = TabController(length: 2, vsync: this);
    //_tabController.addListener(_handleTabSelection);

    // Initialize YouTube player controller
    _youtubeController = YoutubePlayerController(
      initialVideoId: 'vuiXwp86RUg',
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        enableCaption: false,
        loop: false,
        forceHD: false,
        disableDragSeek: true,
        hideControls: false,
        controlsVisibleAtStart: true,
        useHybridComposition: true,
      ),
    );

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    _initPlatformState();

    // Update platform state every 3 sec
    _timerStateUpdater = Timer.periodic(Duration(seconds: 3), (Timer t) {
      _initPlatformState();
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> _initPlatformState() async {
    bool isNfcAvailable;
    try {
      NfcStatus status = await NfcProvider.nfcStatus;
      isNfcAvailable = status == NfcStatus.enabled;
    } on PlatformException {
      isNfcAvailable = false;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _isNfcAvailable = isNfcAvailable;
    });
  }

  @override
  void dispose() {
    /**
     * Cleanup khi widget bị dispose
     * Chỉ remove observer trên Android
     */
    if (Platform.isAndroid) {
      WidgetsBinding.instance.removeObserver(this);
      _log.info("Android: Đã remove lifecycle observer");
    }

    _docNumber.dispose();
    _dob.dispose();
    _doe.dispose();
    _can.dispose();
    _tabController.dispose();
    _youtubeController.dispose();
    _timerStateUpdater.cancel();
    super.dispose();
  }

  /**
   * Override method để monitor app lifecycle state changes
   * CHỈ HOẠT ĐỘNG TRÊN ANDROID - iOS không bị ảnh hưởng
   * 
   * Mục đích:
   * - Theo dõi khi app chuyển từ foreground sang background và ngược lại
   * - Debug để đảm bảo NFC Foreground Dispatch hoạt động đúng
   * - Có thể thêm logic xử lý nếu cần thiết
   */
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    // Chỉ log trên Android để debug
    if (Platform.isAndroid) {
      switch (state) {
        case AppLifecycleState.resumed:
          _log.info(
              "Android: App RESUMED - NFC Foreground Dispatch sẽ được kích hoạt");
          print("SkyFi: App ở foreground - NFC sẽ có độ ưu tiên cao nhất");
          break;
        case AppLifecycleState.paused:
          _log.info("Android: App PAUSED - NFC Foreground Dispatch sẽ bị tắt");
          print("SkyFi: App ở background - Các app khác có thể xử lý NFC");
          break;
        case AppLifecycleState.inactive:
          _log.info("Android: App INACTIVE - Trạng thái chuyển tiếp");
          break;
        case AppLifecycleState.detached:
          _log.info("Android: App DETACHED - App sắp bị terminate");
          break;
        case AppLifecycleState.hidden:
          _log.info("Android: App HIDDEN - App bị ẩn");
          break;
        default:
          _log.info("Android: App state không xác định: $state");
          break;
      }
    }
  }

  /**
   * Method để đảm bảo app luôn ở foreground sau khi đọc NFC
   * CHỈ HOẠT ĐỘNG TRÊN ANDROID - iOS không bị ảnh hưởng
   * 
   * Cơ chế hoạt động:
   * 1. Delay ngắn để đảm bảo NFC operation hoàn tất
   * 2. Disable NFC foreground dispatch để ngăn auto-launch apps khác
   * 3. Log để debug
   */
  /**
   * Method để suppress NFC task chooser dialog và đảm bảo app ở foreground
   */
  Future<void> _suppressNfcDialogAndEnsureForeground() async {
    if (!Platform.isAndroid) {
      return;
    }

    try {
      // 1. Tắt NFC task chooser dialog bằng cách set system flags
      await _suppressNfcTaskChooserDialog();

      // 2. Delay ngắn để đảm bảo NFC operation đã hoàn tất
      await Future.delayed(const Duration(milliseconds: 200));

      _log.info("Android: Đảm bảo app ở foreground và tắt NFC dialog");

      // 3. Đảm bảo app ở foreground
      await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    } catch (e) {
      _log.warning("Android: Lỗi khi suppress NFC dialog: $e");
    }
  }

  /**
   * Method để tắt NFC task chooser dialog thông qua platform channel
   */
  Future<void> _suppressNfcTaskChooserDialog() async {
    if (!Platform.isAndroid) return;

    try {
      const platform = MethodChannel('nfc.skyfi.suppressor');
      await platform.invokeMethod('suppressNfcDialog');
      _log.info("Android: Đã gọi suppress NFC dialog");
    } catch (e) {
      _log.warning("Android: Không thể suppress NFC dialog: $e");
    }
  }

  @Deprecated("Use _suppressNfcDialogAndEnsureForeground instead")
  Future<void> _ensureAppInForeground() async {
    await _suppressNfcDialogAndEnsureForeground();
  }

  DateTime? _getDOBDate() {
    if (_dob.text.isEmpty) {
      return null;
    }
    return DateFormat.yMd().parse(_dob.text);
  }

  DateTime? _getDOEDate() {
    if (_doe.text.isEmpty) {
      return null;
    }
    return DateFormat.yMd().parse(_doe.text);
  }

  /// Mở video hướng dẫn trên YouTube
  ///
  /// Method này sẽ mở link YouTube trong trình duyệt mặc định của thiết bị
  /// Nếu không thể mở được, sẽ hiển thị thông báo lỗi cho người dùng
  Future<void> _openTutorialVideo() async {
    // URL của video hướng dẫn YouTube
    const String videoUrl =
        'https://youtube.com/shorts/vuiXwp86RUg?feature=share';

    try {
      // Tạo Uri object từ string URL
      final Uri url = Uri.parse(videoUrl);

      // Kiểm tra xem có thể mở URL này không
      if (await canLaunchUrl(url)) {
        // Mở URL trong trình duyệt mặc định
        await launchUrl(
          url,
          mode: LaunchMode
              .externalApplication, // Mở trong app bên ngoài (trình duyệt)
        );
        _log.info("Đã mở video hướng dẫn: $videoUrl");
      } else {
        // Không thể mở URL
        _log.warning("Không thể mở video hướng dẫn: $videoUrl");

        // Hiển thị thông báo lỗi cho người dùng
        if (mounted) {
          SnackBarApp.showWarning(
            context,
            message:
                "Không thể mở video hướng dẫn. Vui lòng kiểm tra kết nối internet.",
          );
        }
      }
    } catch (e) {
      // Xử lý lỗi khi mở URL
      _log.error("Lỗi khi mở video hướng dẫn: $e");

      // Hiển thị thông báo lỗi cho người dùng
      if (mounted) {
        SnackBarApp.showWarning(
          context,
          message: "Đã xảy ra lỗi khi mở video hướng dẫn.",
        );
      }
    }
  }

  void _buttonPressed() async {
    print('docNumber: ${_docNumber.text}');
    print('dob: ${_dob.text}');
    print('doe: ${_doe.text}');
    print('can: ${_can.text}');
    print('pace: ${_checkBoxPACE}');
    print("Button pressed");

    // Cache translations to avoid BuildContext async gaps
    final expiryDateRequired = context.l10n.translate('expiry_date_required');
    final birthDateRequired = context.l10n.translate('birth_date_required');
    final citizenIdRequired = context.l10n.translate('citizen_id_required');
    final citizenId6DigitsRequired =
        context.l10n.translate('citizen_id_6_digits_required');

    //Check on what tab we are
    if (Platform.isIOS) {
      //DBA tab
      String errorText = "";
      if (_doe.text.isEmpty) {
        errorText += expiryDateRequired;
      }
      if (_dob.text.isEmpty) {
        errorText += birthDateRequired;
      }
      if (_docNumber.text.isEmpty) {
        errorText += citizenIdRequired;
      }

      setState(() {
        _alertMessage = errorText;
      });
      //If there is an error, just jump out of the function
      if (errorText.isNotEmpty) return;

      final bacKeySeed = DBAKey(_docNumber.text, _getDOBDate()!, _getDOEDate()!,
          paceMode: _checkBoxPACE);
      _readMRTD(accessKey: bacKeySeed, isPace: _checkBoxPACE);
    } else {
      //PACE tab
      String errorText = "";
      if (_can.text.isEmpty) {
        errorText = citizenIdRequired;
      } else if (_can.text.length != 6) {
        errorText = citizenId6DigitsRequired;
      }

      setState(() {
        _alertMessage = errorText;
      });
      //If there is an error, just jump out of the function
      if (errorText.isNotEmpty) return;

      final canKeySeed = CanKey(_can.text);
      _readMRTD(accessKey: canKeySeed, isPace: true);
    }
  }

  void _readMRTD({required AccessKey accessKey, bool isPace = false}) async {
    try {
      // Cache translations to avoid BuildContext async gaps
      final waitingForCardMsg = context.l10n.translate('waiting_for_card');
      final placePhoneNearCardMsg =
          context.l10n.translate('place_phone_near_card_instruction');
      final readingCardMsg = context.l10n.translate('reading_card');
      final readingCardAccessMsg =
          context.l10n.translate('reading_ef_cardaccess_detail');
      final readingCardSecurityMsg =
          context.l10n.translate('reading_ef_cardsecurity_detail');
      final initializingPaceMsg =
          context.l10n.translate('initializing_pace_session_detail');
      final readingComMsg = context.l10n.translate('reading_ef_com_detail');
      final readingDataGroupsMsg =
          context.l10n.translate('reading_data_groups_detail');
      final doingAAMsg = context.l10n.translate('doing_aa');
      final readingSodMsg = context.l10n.translate('reading_ef_sod_detail');
      final cardReadErrorMsg =
          context.l10n.translate('card_read_general_error_detail');
      final cardInitErrorMsg = context.l10n.translate('card_init_error_detail');
      final cardTimeoutMsg = context.l10n.translate('card_read_timeout_detail');
      final cardLostMsg = context.l10n.translate('card_lost_error_detail');
      final cardReadErrorDetailMsg =
          context.l10n.translate('card_read_error_detail');
      final cardReadSuccessMsg =
          context.l10n.translate('card_read_success_detail');

      setState(() {
        _mrtdData = null;
        _alertMessage = waitingForCardMsg;
        _isReading = true;
      });
      try {
        bool demo = false;
        if (!demo) await _nfc.connect(iosAlertMessage: placePhoneNearCardMsg);

        final passport = Passport(_nfc);

        setState(() {
          _alertMessage = readingCardMsg;
        });

        _nfc.setIosAlertMessage(readingCardAccessMsg);
        final mrtdData = MrtdData();

        try {
          mrtdData.cardAccess = await passport.readEfCardAccess();
        } on PassportError {
          //if (e.code != StatusWord.fileNotFound) rethrow;
        }

        _nfc.setIosAlertMessage(readingCardSecurityMsg);

        try {
          //mrtdData.cardSecurity = await passport.readEfCardSecurity();
        } on PassportError {
          //if (e.code != StatusWord.fileNotFound) rethrow;
        }

        _nfc.setIosAlertMessage(initializingPaceMsg);
        //set MrtdData
        mrtdData.isPACE = isPace;
        mrtdData.isDBA = accessKey.PACE_REF_KEY_TAG == 0x01 ? true : false;

        if (isPace) {
          //PACE session
          await passport.startSessionPACE(accessKey, mrtdData.cardAccess!);
        } else {
          //BAC session
          await passport.startSession(accessKey as DBAKey);
        }

        _nfc.setIosAlertMessage(formatProgressMsg(readingComMsg, 0));
        mrtdData.com = await passport.readEfCOM();

        _nfc.setIosAlertMessage(formatProgressMsg(readingDataGroupsMsg, 20));

        if (mrtdData.com!.dgTags.contains(EfDG1.TAG)) {
          mrtdData.dg1 = await passport.readEfDG1();
        }

        if (mrtdData.com!.dgTags.contains(EfDG2.TAG)) {
          mrtdData.dg2 = await passport.readEfDG2();
        }

        // To read DG3 and DG4 session has to be established with CVCA certificate (not supported).
        // if(mrtdData.com!.dgTags.contains(EfDG3.TAG)) {
        //   mrtdData.dg3 = await passport.readEfDG3();
        // }

        // if(mrtdData.com!.dgTags.contains(EfDG4.TAG)) {
        //   mrtdData.dg4 = await passport.readEfDG4();
        // }

        if (mrtdData.com!.dgTags.contains(EfDG5.TAG)) {
          mrtdData.dg5 = await passport.readEfDG5();
        }

        if (mrtdData.com!.dgTags.contains(EfDG6.TAG)) {
          mrtdData.dg6 = await passport.readEfDG6();
        }

        if (mrtdData.com!.dgTags.contains(EfDG7.TAG)) {
          mrtdData.dg7 = await passport.readEfDG7();
        }

        if (mrtdData.com!.dgTags.contains(EfDG8.TAG)) {
          mrtdData.dg8 = await passport.readEfDG8();
        }

        if (mrtdData.com!.dgTags.contains(EfDG9.TAG)) {
          mrtdData.dg9 = await passport.readEfDG9();
        }

        if (mrtdData.com!.dgTags.contains(EfDG10.TAG)) {
          mrtdData.dg10 = await passport.readEfDG10();
        }

        if (mrtdData.com!.dgTags.contains(EfDG11.TAG)) {
          mrtdData.dg11 = await passport.readEfDG11();
        }

        if (mrtdData.com!.dgTags.contains(EfDG12.TAG)) {
          mrtdData.dg12 = await passport.readEfDG12();
        }

        if (mrtdData.com!.dgTags.contains(EfDG13.TAG)) {
          mrtdData.dg13 = await passport.readEfDG13();
        }

        if (mrtdData.com!.dgTags.contains(EfDG14.TAG)) {
          mrtdData.dg14 = await passport.readEfDG14();
        }

        if (mrtdData.com!.dgTags.contains(EfDG15.TAG)) {
          mrtdData.dg15 = await passport.readEfDG15();
          _nfc.setIosAlertMessage(formatProgressMsg(doingAAMsg, 60));
          mrtdData.aaSig = await passport.activeAuthenticate(Uint8List(8));
        }

        if (mrtdData.com!.dgTags.contains(EfDG16.TAG)) {
          mrtdData.dg16 = await passport.readEfDG16();
        }

        _nfc.setIosAlertMessage(formatProgressMsg(readingSodMsg, 80));
        mrtdData.sod = await passport.readEfSOD();

        setState(() {
          _mrtdData = mrtdData;
        });

        setState(() {
          _alertMessage = "";
        });

        /**
         * Tắt NFC task chooser dialog và đảm bảo app ở foreground
         * CHỈ HOẠT ĐỘNG TRÊN ANDROID - iOS không bị ảnh hưởng
         */
        await _suppressNfcDialogAndEnsureForeground();

        // _scrollController.animateTo(300.0,
        //     duration: Duration(milliseconds: 500), curve: Curves.ease);
      } on Exception catch (e) {
        final se = e.toString().toLowerCase();
        setState(() {
          _isReading = false;
        });
        String alertMsg = cardReadErrorMsg;
        if (e is PassportError) {
          if (se.contains("security status not satisfied")) {
            alertMsg = cardInitErrorMsg;
          }
          _log.error("PassportError: ${e.message}");
        } else {
          _log.error(
              "An exception was encountered while trying to read Passport: $e");
        }

        if (se.contains('timeout')) {
          alertMsg = cardTimeoutMsg;
        } else if (se.contains("tag was lost")) {
          alertMsg = cardLostMsg;
        } else if (se.contains("invalidated by user")) {
          alertMsg = "";
        }

        setState(() {
          _alertMessage = alertMsg;
        });
      } finally {
        if (_alertMessage.isNotEmpty) {
          await _nfc.disconnect(iosErrorMessage: _alertMessage);

          /**
           * Tắt NFC dialog và đảm bảo app ở foreground ngay cả khi có lỗi
           * CHỈ HOẠT ĐỘNG TRÊN ANDROID - iOS không bị ảnh hưởng
           */
          await _suppressNfcDialogAndEnsureForeground();

          SnackBarApp.showWarning(context, message: cardReadErrorDetailMsg);
          setState(() {
            _isReading = false;
          });
          // context.pushNamed(AppRouter.doubleCheckInfo, extra: {
          //   'sod': "",
          // });
        } else {
          await _nfc.disconnect(
              iosAlertMessage: formatProgressMsg("Finished", 100));

          /**
           * Tắt NFC dialog và đảm bảo app ở foreground sau khi đọc thành công
           * CHỈ HOẠT ĐỘNG TRÊN ANDROID - iOS không bị ảnh hưởng
           */
          await _suppressNfcDialogAndEnsureForeground();

          SnackBarApp.showSuccess(context, message: cardReadSuccessMsg);
          setState(() {
            _isReading = false;
          });
          context.pushNamed(AppRouter.doubleCheckInfo, extra: {
            'sod': _mrtdData!.sod!.toBytes().hex(),
          });
        }
      }
    } on Exception catch (e) {
      _log.error("Read MRTD error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const StepIndicator(
          total: 4,
          current: 3,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: AppSpacing.xxl),
                Text(
                  context.l10n.translate('prepare_scan_citizen_id_title'),
                  style: AppTextStyles.title
                      .copyWith(color: AppColors.text, fontSize: 22),
                ),
                const SizedBox(height: AppSpacing.xxl),
                TextButton(
                  onPressed: () {
                    // Mở video hướng dẫn YouTube khi người dùng tap vào text
                    _openTutorialVideo();
                  },
                  child: Text(
                    context.l10n.translate('watch_tutorial_video_link'),
                    style: AppTextStyles.title.copyWith(
                      color: AppColors.blue,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.blue,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.1),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: YoutubePlayerBuilder(
                      onEnterFullScreen: () {
                        // Prevent entering fullscreen by returning immediately
                        return;
                      },
                      onExitFullScreen: () {
                        // Handle exit fullscreen if needed
                      },
                      player: YoutubePlayer(
                        controller: _youtubeController,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: AppColors.blue,
                        progressColors: ProgressBarColors(
                          playedColor: AppColors.blue,
                          handleColor: AppColors.blue,
                        ),
                        bottomActions: [
                          // Custom bottom actions without fullscreen button
                          CurrentPosition(),
                          const SizedBox(width: 10.0),
                          ProgressBar(isExpanded: true),
                          const SizedBox(width: 10.0),
                          RemainingDuration(),
                          // Note: Removed FullScreenButton() to hide fullscreen
                        ],
                        onReady: () {
                          // Ensure portrait orientation when player is ready
                          SystemChrome.setPreferredOrientations([
                            DeviceOrientation.portraitUp,
                            DeviceOrientation.portraitDown,
                          ]);
                        },
                      ),
                      builder: (context, player) {
                        return player;
                      },
                    ),
                  ),
                ),
                Spacer(),
                GradientButton(
                  height: 50,
                  onPressed: _buttonPressed,
                  text: _isReading
                      ? context.l10n.translate('reading_progress')
                      : context.l10n.translate('im_ready_button'),
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                Row(children: <Widget>[
                  Text(context.l10n.translate('nfc_available_label'),
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold)),
                  SizedBox(width: 4),
                  Text(
                      _isNfcAvailable
                          ? context.l10n.translate('yes_nfc')
                          : context.l10n.translate('no_nfc'),
                      style: TextStyle(fontSize: 18.0))
                ]),
                SizedBox(height: 15),
                Text(_alertMessage,
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold)),
                SizedBox(height: 15),
              ]),
        ),
      ),
    );
  }
}
