// @dart=2.9

import 'package:quiz_flutter/api/mdt_auth_client.dart';
import 'package:quiz_flutter/api/mdt_password_client.dart';
import 'package:quiz_flutter/helpers/dependecy_injector.dart';
import 'package:quiz_flutter/models/quiz/user.dart';
import 'package:quiz_flutter/services/auth_service.dart';

void main() async {
  await injectDependencies();

  var authClient = sl<MdtAuthClient>();
  var passwordClient = sl<MdtPasswordClient>();
  var authService = sl<AuthService>();

  var authResponse = await authClient.signIn(
      login: "svoinkov", password: "rB12rb", rememberMe: true);
  var mdtUser = await authClient.getMdtUser();

  var mdtPrincipal = await authService.getMdtPrincipal(mdtUser.id);
  var quizUser = QuizUser.create(mdtUser, mdtPrincipal);

  print(quizUser.email);
}
