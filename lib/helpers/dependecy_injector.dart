import 'package:get_it/get_it.dart';
import 'package:quiz_flutter/api/mdt_api_client.dart';
import 'package:quiz_flutter/api/mdt_auth_client.dart';
import 'package:quiz_flutter/api/mdt_password_client.dart';
import 'package:quiz_flutter/services/auth_service.dart';
import 'package:quiz_flutter/services/outlet_service.dart';
import 'package:quiz_flutter/services/user_service.dart';

/// Service locator
final GetIt sl = GetIt.instance;

Future<void> injectDependencies() async {
  sl
    // api clients
    ..registerSingleton<MdtApiClient>(MdtApiClient())
    ..registerSingleton<MdtAuthClient>(MdtAuthClient())
    ..registerSingleton<MdtPasswordClient>(MdtPasswordClient())
    // services
    ..registerSingleton<AuthService>(AuthService())
    ..registerSingleton<UserService>(UserService())
    ..registerSingleton<OutletService>(OutletService());
}
