// @dart=2.9

import 'package:quiz_flutter/helpers/app_initializer.dart' as initializer;
import 'package:quiz_flutter/helpers/dependecy_injector.dart' as di;
import 'package:quiz_flutter/models/quiz/user.dart';

void main() async {
  await initializer.initServices();

  var authClient = di.mdtAuthClient;
  var passwordClient = di.mdtPasswordClient;
  var authService = di.authService;

  var authResponse = await authClient.signIn(
      login: "svoinkov", password: "rB12rb", rememberMe: true);
  var mdtUser = await authClient.getMdtUser();

  var mdtPrincipal = await authService.getMdtPrincipal(mdtUser.id);
  var quizUser = QuizUser.create(mdtUser, mdtPrincipal);

  print(quizUser.email);
}
