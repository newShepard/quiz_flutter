// @dart=2.9

import 'package:quiz_flutter/services/app_service.dart' as di;
import 'package:quiz_flutter/utils/utils.dart';
import 'models/quiz/user.dart';

void main() async {
  await di.initServices();

  var auth = di.mdtAuthClient;
  var pass = di.mdtPasswordClient;

  var authResponse = await auth.signIn(
      login: "svoinkov", password: "rB12rb", rememberMe: true);
  var mdtUser = await auth.getMdtUser();

  var mdtPrincipal = await di.authService.getMdtPrincipal(mdtUser.id);
  var quizUser = QuizUser.create(mdtUser, mdtPrincipal);

  print(quizUser.email);
}
