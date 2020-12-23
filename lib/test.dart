import 'package:quiz_flutter/api/mdt_auth_client.dart';
import 'package:quiz_flutter/api/mdt_password_client.dart';
import 'package:quiz_flutter/helpers/dependecy_injector.dart';
import 'package:quiz_flutter/services/auth_service.dart';

void main() async {
  await injectDependencies();

  var authClient = sl<MdtAuthClient>();
  var passwordClient = sl<MdtPasswordClient>();
  var authService = sl<AuthService>();

  await authService.signIn(login: 'svoinkov', password: 'rB12rb');
  var user = await authService.initUser();
  print(user.fullName);
}
