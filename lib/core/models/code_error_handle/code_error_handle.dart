import 'package:freezed_annotation/freezed_annotation.dart';

part 'code_error_handle.freezed.dart';
part 'code_error_handle.g.dart';

@freezed
class CodeErrorHandle with _$CodeErrorHandle {
  factory CodeErrorHandle({
    dynamic requestId,
    int? code,
    String? message,
    int? totalRecords,
    dynamic result,
    dynamic extra,
  }) = _CodeErrorHandle;

  factory CodeErrorHandle.fromJson(Map<String, dynamic> json) =>
      _$CodeErrorHandleFromJson(json);
}
