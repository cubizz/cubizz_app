import 'package:cupizz_app/src/components/current_user/current_user.controller.dart';
import 'package:momentum/momentum.dart';

import '../../services/index.dart';
import 'index.dart';

class AuthController extends MomentumController<AuthModel> {
  @override
  AuthModel init() {
    return AuthModel(this);
  }

  bootstrapAsync() async {
    if (!await isAuthenticated) {
      getService<AuthService>().gotoAuth();
    }
    super.bootstrapAsync();
  }

  Future<bool> get isAuthenticated async =>
      (await getService<StorageService>().getToken) != null;

  Future<void> login(String email, String password) async {
    await getService<AuthService>().login(email, password);
    await dependOn<CurrentUserController>().getCurrentUser();
  }

  Future<void> logout() => getService<AuthService>().logout();
}
