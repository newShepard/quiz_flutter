import 'package:get_it/get_it.dart';
import 'package:quiz_flutter/api/mdt_api_client.dart';
import 'package:quiz_flutter/api/mdt_auth_client.dart';
import 'package:quiz_flutter/api/mdt_password_client.dart';
import 'package:quiz_flutter/services/auth_service.dart';

final getIt = GetIt.instance;

Future initServices() async {
  print('Hello');
  // api clients
  getIt.registerSingleton<MdtApiClient>(MdtApiClient());
  getIt.registerSingleton<MdtAuthClient>(MdtAuthClient());
  getIt.registerSingleton<MdtPasswordClient>(MdtPasswordClient());

  // services
  getIt.registerSingleton<AuthService>(AuthService());
}

final mdtApiClient = getIt<MdtApiClient>();
final mdtAuthClient = getIt<MdtAuthClient>();
final mdtPasswordClient = getIt<MdtPasswordClient>();
final authService = getIt<AuthService>();
