import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/user_info.dart';
part 'user_info_provider.g.dart';

typedef UserInfoState = UserInfo;

@Riverpod(
  keepAlive: true,
)
class UserInfoProvider extends _$UserInfoProvider {
  @override
  UserInfo build() => UserInfo();

  void setUserInfo(UserInfo userInfo) {
    state = userInfo;
  }
}
