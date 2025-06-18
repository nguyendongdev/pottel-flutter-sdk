import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';
part 'user_info.g.dart';

// {
//     "requestId": null,
//     "code": 200,
//     "message": "Gọi service thành công",
//     "totalRecords": 0,
//     "result": {
//         "msisdn": "0772402457",
//         "full_name": "HÀ TÀI ĐỨC",
//         "address": "Tổ 2A Phường Định Công, Quận Hoàng Mai, Thành Phố Hà Nội",
//         "active_date": "09/05/2025 12:10:04",
//         "balace": "9850",
//         "id_number": "033087007827",
//         "id_issue_place": "BCA",
//         "id_issue_date": "25/04/2021 00:00:00",
//         "gender": null,
//         "email": ""
//     },
//     "extra": null
// }

@freezed
class UserInfoResponse with _$UserInfoResponse {
  const factory UserInfoResponse({
    String? requestId,
    int? code,
    String? message,
    int? totalRecords,
    UserInfo? result,
    dynamic extra,
  }) = _UserInfoResponse;

  factory UserInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$UserInfoResponseFromJson(json);
}

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo(
      {@JsonKey(name: 'msisdn') String? msisdn,
      @JsonKey(name: 'full_name') String? fullName,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'active_date') String? activeDate,
      @JsonKey(name: 'balace') String? balace,
      @JsonKey(name: 'id_number') String? idNumber,
      @JsonKey(name: 'id_issue_place') String? idIssuePlace,
      @JsonKey(name: 'id_issue_date') String? idIssueDate,
      @JsonKey(name: 'gender') String? gender,
      @JsonKey(name: 'email') String? email,
      @JsonKey(name: 'birthday') String? birthday}) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}
