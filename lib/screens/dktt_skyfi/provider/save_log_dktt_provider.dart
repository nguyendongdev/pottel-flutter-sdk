import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/save_log_dktt/save_log_dktt.dart';

part 'save_log_dktt_provider.g.dart';

@Riverpod(keepAlive: true)
class SaveLogDkttNotifier extends _$SaveLogDkttNotifier {
  @override
  SaveLogDktt build() {
    return SaveLogDktt(
      img1: '',
      img2: '',
      img3: '',
      img4: '',
    );
  }

  void setPhone(String? value) => state = state.copyWith(phone: value);
  void setIsUpdate(int? value) => state = state.copyWith(isUpdate: value);
  void setAgentCode(String? value) => state = state.copyWith(agentCode: value);
  void setVideoSource(String? value) =>
      state = state.copyWith(videoSource: value);
  void setImg1(String? value) {
    state = state.copyWith(img1: value);
  }

  void setImg2(String? value) => state = state.copyWith(img2: value);
  void setImg3(String? value) => state = state.copyWith(img3: value);
  void setImg4(String? value) => state = state.copyWith(img4: value);
  void setSeri(String? value) => state = state.copyWith(seri: value);
  void setObject(String? value) => state = state.copyWith(object: value);
  void setCardType(String? value) => state = state.copyWith(cardType: value);
  void setIdNumber(String? value) => state = state.copyWith(idNumber: value);
  void setPassport(String? value) => state = state.copyWith(passport: value);
  void setFullName(String? value) => state = state.copyWith(fullName: value);
  void setBirthDay(String? value) => state = state.copyWith(birthDay: value);
  void setGender(String? value) => state = state.copyWith(gender: value);
  void setAddress(String? value) => state = state.copyWith(address: value);
  void setIssueDate(String? value) => state = state.copyWith(issueDate: value);
  void setIssuePlace(String? value) =>
      state = state.copyWith(issuePlace: value);
  void setInternational(String? value) =>
      state = state.copyWith(international: value);
  void setContactPhone(String? value) =>
      state = state.copyWith(contactPhone: value);
  void setHomeTown(String? value) => state = state.copyWith(homeTown: value);
  void setCityCode(String? value) => state = state.copyWith(cityCode: value);
  void setFaceMatching(int? value) =>
      state = state.copyWith(faceMatching: value);
  void setImsi(String? value) => state = state.copyWith(imsi: value);
  void setExpireDate(String? value) =>
      state = state.copyWith(expireDate: value);
  void setSob(String? value) => state = state.copyWith(sob: value);

  // set city code and district code and ward code
  void setDistrictCode(String? value) =>
      state = state.copyWith(districtCode: value);
  void setWardCode(String? value) => state = state.copyWith(wardCode: value);

  // Reset all values
  void reset() => state = SaveLogDktt();

  // Update multiple values at once
  void updateValues(SaveLogDktt newValues) => state = newValues;
}
