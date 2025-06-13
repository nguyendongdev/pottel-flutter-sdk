import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../network/api.dart';
import '../models/user.dart';

part 'users_provider.g.dart';

@riverpod
class Users extends _$Users {
  @override
  Future<UsersResponse> build() async {
    return _fetchUsers();
  }

  Future<UsersResponse> _fetchUsers() async {
    final response = await ref.read(apiProvider).get('/bss/app/users');
    return UsersResponse.fromJson(response.data);
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}

@riverpod
API api(ApiRef ref) => API();
