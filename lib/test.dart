import 'dart:convert' as convert;
import 'package:quiz_flutter/api/mdt_api_client.dart';
import 'package:quiz_flutter/api/mdt_api_client_auth.dart';
import 'package:quiz_flutter/utils/constants.dart';

void main() async {
  var client = new MdtApiClient(Consts.api_url, Consts.app_url);
  var auth = new MdtApiClientAuth(client);

  var r = await auth.signIn(login: "svoinkov", password: "rB12rb");
  print("Signin status: ${r.statusCode}");
  var r2 = await auth.signOut();
  print("Signout status: ${r2.statusCode}");
}
