import 'package:quiz_flutter/api/mdt_api_client.dart';
import 'package:quiz_flutter/api/mdt_auth_module.dart';
import 'package:quiz_flutter/utils/constants.dart';
import 'api/mdt_password_module.dart';

void main() async {
  var client = new MdtApiClient(Consts.api_url, Consts.app_url);
  var auth = new MdtAuthModule(client);
  var pass = new MdtPasswordModule(client);

  var authResponse = await auth.signIn(
      login: "svoinkov", password: "rB12rb", rememberMe: true);

  var user = await auth.user();

  print("AuthStatus ${authResponse.statusCode}");
  print("User: ${user}");

  var fetch = await client.request(
    "fetch/qst.PrincipalCache",
    data: {
      "filter": "[ID] eq 415",
      "select":
          "FlagAdmin,FlagGetLog,FlagRouteExists,FlagSuperVisor,ID_Position,ID_Employee/*",
      "table": "qst.PrincipalCache",
    },
  );

  print("cache: ${fetch?.data}");
}
