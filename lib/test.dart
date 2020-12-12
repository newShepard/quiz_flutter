// @dart=2.9
import 'package:quiz_flutter/api/mdt_api_client.dart';
import 'package:quiz_flutter/api/mdt_auth_module.dart';
import 'package:quiz_flutter/models/mdt_api/principal.dart';
import 'package:quiz_flutter/models/mdt_api/user.dart';
import 'package:quiz_flutter/models/mdt_api/employee.dart';
import 'package:quiz_flutter/services/auth_service.dart';
import 'package:quiz_flutter/utils/constants.dart';
import 'api/mdt_password_module.dart';
import 'models/quiz/user.dart';

void main() async {
  var client = new MdtApiClient(Consts.api_url, Consts.app_url);
  var auth = new MdtAuthModule(client);
  var pass = new MdtPasswordModule(client);
  var authService = new AuthService(mdtApiClient: client);

  var authResponse = await auth.signIn(
      login: "svoinkov", password: "rB12rb", rememberMe: true);

  var mdtUser = await auth.user();
  var mdtPrincipal = await authService.getPrincipal(mdtUser.id);
}
