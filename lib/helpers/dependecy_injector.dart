import 'package:get_it/get_it.dart';
import 'package:quiz_flutter/api/mdt_api_client.dart';
import 'package:quiz_flutter/api/mdt_auth_client.dart';
import 'package:quiz_flutter/api/mdt_password_client.dart';
import 'package:quiz_flutter/services/auth_service.dart';

/// Service locator
final GetIt sl = GetIt.instance;

Future<void> injectDependencies() async {
  // api clients
  sl.registerSingleton<MdtApiClient>(MdtApiClient());
  sl.registerSingleton<MdtAuthClient>(MdtAuthClient());
  sl.registerSingleton<MdtPasswordClient>(MdtPasswordClient());

  // services
  sl.registerSingleton<AuthService>(AuthService());
}
