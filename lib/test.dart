import 'package:quiz_flutter/api/mdt_auth_client.dart';
import 'package:quiz_flutter/api/mdt_password_client.dart';
import 'package:quiz_flutter/helpers/dependecy_injector.dart';
import 'package:quiz_flutter/services/auth_service.dart';
import 'package:quiz_flutter/services/outlet_service.dart';

void main() async {
  await injectDependencies();

  var authClient = sl<MdtAuthClient>();
  var passwordClient = sl<MdtPasswordClient>();
  var authService = sl<AuthService>();
  var outletService = sl<OutletService>();

  await authService.signIn(login: 'svoinkov', password: 'rB12rb');
  var user = await authService.initUser();
  print(user.fullName);
  var outlets = await outletService.getNearestOutlets();

  for (var i = 0; i < outlets.length; i++) {
    var record = outlets[i];
    print(record.distance);
  }
}
