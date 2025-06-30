import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:skyfi_sdk/screens/dktt_skyfi/models/get_number_id_regis/get_number_id_regis.dart';
import 'package:skyfi_sdk/utilities/common.dart';
import 'package:skyfi_sdk/utilities/ekyc_helper.dart';
import '../../core/models/code_error_handle/code_error_handle.dart';
import '../../core/widgets/snack_bar_app.dart';
import '../../network/api.dart';
import '../../network/ekyc_api.dart';
import '../../routers/routers.dart';
import 'models/face_matching_response/face_matching_response.dart';
import 'models/respone_cards_ekyc/respone_cards_ekyc.dart';
import 'provider/save_log_dktt_provider.dart';
import 'widgets/preview_overlay.dart';
import 'provider/ekyc_provider.dart';

class PreviewCaptureChipCardScreen extends HookConsumerWidget {
  const PreviewCaptureChipCardScreen({
    super.key,
    required this.image,
    required this.type,
  });
  final String image;
  final EkycType type;
  // loading
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // print('image: $image');
    // print('type: $type');
    final ekycApi = EKYC_API();
    final api = API();

    // THAY ĐỔI: Sử dụng parameter type làm source of truth thay vì provider state
    // Lý do: Tránh vấn đề desync khi user nhấn back
    // Logic cũ: final ekycType = ref.watch(typesScreenProvider);
    final currentType = type; // Sử dụng type từ parameter thay vì từ provider

    final isLoading = useState(true);
    final isCanNext = useState(false);

    Future<bool> checkIsCanRegister(String id) async {
      try {
        Common.loadingWithContext(context, show: true);
        final response =
            await api.post('/bss/videocall/check-number-sim-registered', data: {
          'id_number': id,
        });
        final data = response.data as Map<String, dynamic>;
        final statusCode = response.statusCode;
        final codeErrorHandle = CodeErrorHandle.fromJson(data);
        if (statusCode == 200) {
          if (codeErrorHandle.code == 200) {
            final numberIdRegis = GetNumberIdRegis.fromJson(data);
            return numberIdRegis.result!.value! <
                numberIdRegis.result!.valueBlock!;
          } else {
            return false;
          }
        } else {
          return false;
        }
      } catch (e) {
        return false;
      } finally {
        Common.loadingWithContext(context, show: false);
      }
    }

    Future<void> onConvertFileToBase64() async {
      // THAY ĐỔI: Sửa điều kiện kiểm tra để chỉ dựa vào parameter type
      // Logic cũ: if (ekycType == EkycType.cartFront && type == EkycType.cartFront)
      // Logic mới: chỉ kiểm tra currentType (parameter type)
      // Lợi ích: Tránh vấn đề khi provider state và parameter không khớp do user nhấn back
      if (currentType == EkycType.cartFront) {
        isLoading.value = true;
        try {
          final base64FrontImage = image;
          final response = await ekycApi.post('/ekyc/v1/front', data: {
            'image_front_base64': base64FrontImage,
          });
          if (response.data['code'] != 200) {
            return SnackBarApp.showError(context,
                message: EkycHelper.getMessageErrorOcr(response.data['code']));
          }

          final idnumber = response.data['result']['idnumber'];
          final isCanRegister = await checkIsCanRegister(idnumber ?? '');
          if (!isCanRegister) {
            return SnackBarApp.showError(context,
                message:
                    'Giấy tờ này đã đăng ký thông tin vượt quá số lượng TB cho phép. Vui lòng kiểm tra lại!');
          }
          SnackBarApp.showSuccess(context, message: 'Thành công!');
          // loading true = disable button next
          isCanNext.value = true;
          print('base64FrontImage : ${response.data}');
          ref
              .read(saveLogDkttNotifierProvider.notifier)
              .setImg1(base64FrontImage);

          // THÊM: Đồng bộ provider state với current type để đảm bảo consistency
          // Điều này giúp các component khác có thể đọc đúng state hiện tại
          ref
              .read(typesScreenProvider.notifier)
              .setEkycType(EkycType.cartFront);
        } catch (e) {
          print('error: $e');
        } finally {
          isLoading.value = false;
        }
      }

      // THAY ĐỔI: Sửa điều kiện kiểm tra tương tự cho cartBack
      // Logic cũ: if (ekycType == EkycType.cartBack && type == EkycType.cartBack)
      // Logic mới: chỉ kiểm tra currentType, loại bỏ double-check
      if (currentType == EkycType.cartBack) {
        try {
          isLoading.value = true;
          final base64FrontImage = ref.read(saveLogDkttNotifierProvider).img1;
          final base64BackImage = image;
          final response = await ekycApi.post('/ekyc/v1/ocr', data: {
            "image_front_base64": base64FrontImage,
            'image_back_base64': base64BackImage,
          });
          print('response: ${response.data}');
          final cards = ResponeCardsEkyc.fromJson(response.data);

          if (response.data['code'] != 0) {
            return SnackBarApp.showError(context,
                message: EkycHelper.getMessageErrorOcr(response.data['code']));
          }

          SnackBarApp.showSuccess(context, message: 'Thành công!');
          isCanNext.value = true;
          ref
              .read(saveLogDkttNotifierProvider.notifier)
              .setImg2(base64BackImage);
          ref.read(saveLogDkttNotifierProvider.notifier).setCardType("CCCD");
          ref
              .read(saveLogDkttNotifierProvider.notifier)
              .setIdNumber(cards.result?.idnumber);
          ref
              .read(saveLogDkttNotifierProvider.notifier)
              .setFullName(cards.result?.name);
          ref
              .read(saveLogDkttNotifierProvider.notifier)
              .setBirthDay(cards.result?.dob);
          ref
              .read(saveLogDkttNotifierProvider.notifier)
              .setGender(cards.result?.gender);
          ref
              .read(saveLogDkttNotifierProvider.notifier)
              .setAddress(cards.result?.address);
          ref
              .read(saveLogDkttNotifierProvider.notifier)
              .setIssueDate(cards.result?.issueDate);
          ref
              .read(saveLogDkttNotifierProvider.notifier)
              .setIssuePlace(cards.result?.issuedPlace);
          ref
              .read(saveLogDkttNotifierProvider.notifier)
              .setInternational("VNM");
          ref.read(saveLogDkttNotifierProvider.notifier).setContactPhone("");
          ref
              .read(saveLogDkttNotifierProvider.notifier)
              .setHomeTown(cards.result?.placeOfOrigin);
          ref
              .read(saveLogDkttNotifierProvider.notifier)
              .setCityCode(cards.result?.addressDetail?.city?.cityCode);
          ref.read(saveLogDkttNotifierProvider.notifier).setDistrictCode(
              cards.result?.addressDetail?.district?.districtCode);
          ref
              .read(saveLogDkttNotifierProvider.notifier)
              .setWardCode(cards.result?.addressDetail?.ward?.wardCode);
          ref
              .read(saveLogDkttNotifierProvider.notifier)
              .setExpireDate(cards.result?.expiredDate);

          // THÊM: Đồng bộ provider state với current type
          ref.read(typesScreenProvider.notifier).setEkycType(EkycType.cartBack);
          //
        } catch (e) {
          print('error: $e');
        } finally {
          isLoading.value = false;
        }
      }

      // THAY ĐỔI: Sửa điều kiện kiểm tra cho selfie
      // Logic cũ: if (ekycType == EkycType.selfie)
      // Logic mới: sử dụng currentType từ parameter
      if (currentType == EkycType.selfie) {
        try {
          isLoading.value = true;
          final base64FrontImage = ref.read(saveLogDkttNotifierProvider).img1;
          print('base64FrontImage: $base64FrontImage');
          final base64SelfieImage = image;
          final response = await ekycApi.post('/ekyc/v1/face_matching', data: {
            "image_front_base64": base64FrontImage,
            'image_face_base64': base64SelfieImage,
          });
          print('response: ${response.data}');
          final result = FaceMatchingResponse.fromJson(response.data);

          if (result.code == 0) {
            ref
                .read(saveLogDkttNotifierProvider.notifier)
                .setFaceMatching(result.result?.faceScore?.toInt());
            ref
                .read(saveLogDkttNotifierProvider.notifier)
                .setImg3(base64SelfieImage);
            isCanNext.value = true;

            // THÊM: Đồng bộ provider state với current type
            ref.read(typesScreenProvider.notifier).setEkycType(EkycType.selfie);
            return;
          }

          if (result.code != 0) {
            return SnackBarApp.showError(context,
                message: EkycHelper.getMessageFace(result.code ?? 0));
          }
        } catch (e) {
          print('error: $e');
        } finally {
          isLoading.value = false;
        }
      }
    }

    // THAY ĐỔI: Cập nhật useEffect dependency
    // Logic cũ: [ekycType, type, image] - phụ thuộc vào provider state
    // Logic mới: [currentType, image] - chỉ phụ thuộc vào parameter và image
    // Lợi ích: useEffect không bị trigger sai khi provider state thay đổi không mong muốn
    useEffect(() {
      onConvertFileToBase64();
      return null;
    }, [currentType, image]);

    void onNext() {
      // THAY ĐỔI: Sử dụng currentType thay vì ekycType từ provider
      // Logic navigation được giữ nguyên hoàn toàn, chỉ thay đổi variable name
      // Đảm bảo không ảnh hưởng đến flow logic hiện tại
      if (currentType == EkycType.cartFront) {
        ref.read(typesScreenProvider.notifier).setEkycType(EkycType.cartBack);
        isCanNext.value = false;
        context.pushNamed(AppRouter.captureChipCard, extra: EkycType.cartBack);
      }
      if (currentType == EkycType.cartBack) {
        ref.read(typesScreenProvider.notifier).setEkycType(EkycType.selfie);
        isCanNext.value = false;
        context.pushNamed(AppRouter.prepareFace, extra: EkycType.selfie);
      }
      if (currentType == EkycType.selfie) {
        // context.pushNamed(AppRouter.prepareScanChipCard);
        final saveLog = ref.watch(saveLogDkttNotifierProvider);
        final idnumber = saveLog.idNumber;
        final dob = saveLog.birthDay;
        final expireDate = saveLog.expireDate;

        // check idnumber, dob, expireDate

        // context.pushNamed(AppRouter.scanNfcChipcard);
        context.pushNamed(AppRouter.scanNfcChipcard, extra: {
          'docNumber': idnumber?.substring(3),
          'dob': Common.convertDateFormat(dob ?? ''),
          'doe': Common.convertDateFormat(expireDate ?? ''),
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.black, // Thêm background color cho Scaffold
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black,
        child: Stack(
          children: [
            if (isLoading.value)
              const Center(
                child: CircularProgressIndicator(),
              )
            else
              Image.memory(
                base64Decode(image),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
                frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
                  if (wasSynchronouslyLoaded) return child;
                  return AnimatedOpacity(
                    opacity: frame == null ? 0 : 1,
                    duration: const Duration(milliseconds: 300),
                    child: child,
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.black,
                    child: const Center(
                      child: Icon(
                        Icons.error,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                  );
                },
              ),
            // Image.file(
            //   width: MediaQuery.of(context).size.width,
            //   height: MediaQuery.of(context).size.height,
            //   File(file.path),
            //   fit: BoxFit.cover,
            // ),
            PreviewOverlay(
              canNext: isCanNext.value,
              loading: isLoading.value,
              // THAY ĐỔI: Sử dụng currentType thay vì ekycType từ provider
              // Đảm bảo UI hiển thị đúng theo parameter được truyền vào
              type: currentType,
              onNext: () {
                onNext();
              },
              onBack: () {
                 Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
