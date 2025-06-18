// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoResponseImpl _$$UserInfoResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$UserInfoResponseImpl(
      requestId: json['requestId'] as String?,
      code: (json['code'] as num?)?.toInt(),
      message: json['message'] as String?,
      totalRecords: (json['totalRecords'] as num?)?.toInt(),
      result: json['result'] == null
          ? null
          : UserInfo.fromJson(json['result'] as Map<String, dynamic>),
      extra: json['extra'],
    );

Map<String, dynamic> _$$UserInfoResponseImplToJson(
        _$UserInfoResponseImpl instance) =>
    <String, dynamic>{
      'requestId': instance.requestId,
      'code': instance.code,
      'message': instance.message,
      'totalRecords': instance.totalRecords,
      'result': instance.result,
      'extra': instance.extra,
    };

_$UserInfoImpl _$$UserInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoImpl(
      msisdn: json['msisdn'] as String?,
      fullName: json['full_name'] as String?,
      address: json['address'] as String?,
      activeDate: json['active_date'] as String?,
      balace: json['balace'] as String?,
      idNumber: json['id_number'] as String?,
      idIssuePlace: json['id_issue_place'] as String?,
      idIssueDate: json['id_issue_date'] as String?,
      gender: json['gender'] as String?,
      email: json['email'] as String?,
      birthday: json['birthday'] as String?,
    );

Map<String, dynamic> _$$UserInfoImplToJson(_$UserInfoImpl instance) =>
    <String, dynamic>{
      'msisdn': instance.msisdn,
      'full_name': instance.fullName,
      'address': instance.address,
      'active_date': instance.activeDate,
      'balace': instance.balace,
      'id_number': instance.idNumber,
      'id_issue_place': instance.idIssuePlace,
      'id_issue_date': instance.idIssueDate,
      'gender': instance.gender,
      'email': instance.email,
      'birthday': instance.birthday,
    };
