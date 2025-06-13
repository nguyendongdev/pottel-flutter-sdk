import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'login_provider.g.dart';

@Riverpod(keepAlive: true)
class IsLogin extends _$IsLogin {
  @override
  bool build() => false;

  void setIsLogin(bool value) {
    state = value;
  }
}

@Riverpod(keepAlive: true)
class CurrentPhone extends _$CurrentPhone {
  @override
  String build() => '';

  void setCurrentPhone(String value) {
    state = value;
  }
}
