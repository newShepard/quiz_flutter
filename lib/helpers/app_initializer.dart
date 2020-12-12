import 'package:get_it/get_it.dart';
import 'package:quiz_flutter/api/mdt_api_client.dart';
import 'package:quiz_flutter/api/mdt_auth_client.dart';
import 'package:quiz_flutter/api/mdt_password_client.dart';
import 'package:quiz_flutter/services/auth_service.dart';

Future initServices() async {
  final getIt = GetIt.instance;
  // api clients
  getIt.registerSingleton<MdtApiClient>(MdtApiClient());
  getIt.registerSingleton<MdtAuthClient>(MdtAuthClient());
  getIt.registerSingleton<MdtPasswordClient>(MdtPasswordClient());

  // services
  getIt.registerSingleton<AuthService>(AuthService());
}
