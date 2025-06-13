// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultImpl _$$ResultImplFromJson(Map<String, dynamic> json) => _$ResultImpl(
      iccid: json['iccid'] as String?,
      imsi: json['imsi'] as String?,
      callId: json['call_id'] as String?,
      checkExist: json['checkExist'] as bool?,
    );

Map<String, dynamic> _$$ResultImplToJson(_$ResultImpl instance) =>
    <String, dynamic>{
      'iccid': instance.iccid,
      'imsi': instance.imsi,
      'call_id': instance.callId,
      'checkExist': instance.checkExist,
    };
