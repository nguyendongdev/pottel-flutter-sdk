import 'package:freezed_annotation/freezed_annotation.dart';

part 'mrz.freezed.dart';
part 'mrz.g.dart';

@freezed
class Mrz with _$Mrz {
  factory Mrz({
    @JsonKey(name: 'check_composite') String? checkComposite,
    @JsonKey(name: 'check_date_of_birth') String? checkDateOfBirth,
    @JsonKey(name: 'check_expiration_date') String? checkExpirationDate,
    @JsonKey(name: 'check_number') String? checkNumber,
    String? country,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    @JsonKey(name: 'expiration_date') String? expirationDate,
    @JsonKey(name: 'mrz_type') String? mrzType,
    String? names,
    String? nationality,
    String? number,
    String? optional1,
    String? optional2,
    @JsonKey(name: 'raw_text') String? rawText,
    String? sex,
    String? surname,
    String? type,
    @JsonKey(name: 'valid_composite') bool? validComposite,
    @JsonKey(name: 'valid_date_of_birth') bool? validDateOfBirth,
    @JsonKey(name: 'valid_expiration_date') bool? validExpirationDate,
    @JsonKey(name: 'valid_number') bool? validNumber,
    @JsonKey(name: 'valid_score') int? validScore,
  }) = _Mrz;

  factory Mrz.fromJson(Map<String, dynamic> json) => _$MrzFromJson(json);
}
