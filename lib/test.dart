// @dart=2.9
import 'package:quiz_flutter/api/mdt_api_client.dart';
import 'package:quiz_flutter/api/mdt_auth_module.dart';
import 'package:quiz_flutter/services/auth_service.dart';
import 'package:quiz_flutter/utils/constants.dart';
import 'api/mdt_password_module.dart';
import 'models/quiz/user.dart';

void main() async {
  var client = new MdtApiClient(Consts.api_url, Consts.app_url);
  var auth = new MdtAuthClient(client);
  var pass = new MdtPasswordClient(client);
  var authService = new AuthService(mdtApiClient: client);

  var mdtUser = await auth.getMdtUser();

  print('HELLO');

  // var authResponse = await auth.signIn(
  //     login: "svoinkov", password: "rB12rb", rememberMe: true);

  // var mdtPrincipal = await authService.getMdtPrincipal(mdtUser.id);

  // var quizUser = QuizUser.create(mdtUser, mdtPrincipal);
}
