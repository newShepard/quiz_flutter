// import 'package:connectivity/connectivity.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

import 'package:quiz_flutter/api/mdt_auth_client.dart';
import 'package:quiz_flutter/api/mdt_password_client.dart';
import 'package:quiz_flutter/helpers/dependecy_injector.dart';
import 'package:quiz_flutter/models/mdt_api/principal.dart';
import 'package:quiz_flutter/models/mdt_api/user.dart';
import 'package:quiz_flutter/models/quiz/user.dart';
import 'package:quiz_flutter/services/auth_service.dart';

void main() async {
  await injectDependencies();

  var authClient = sl<MdtAuthClient>();
  var passwordClient = sl<MdtPasswordClient>();
  var authService = sl<AuthService>();

  var user = await authService.initUser();
  print(user.fullName);
}
