import 'package:get_it/get_it.dart';
import 'package:quiz_flutter/api/mdt_api_client.dart';
import 'package:quiz_flutter/api/mdt_auth_client.dart';
import 'package:quiz_flutter/api/mdt_password_client.dart';
import 'package:quiz_flutter/services/auth_service.dart';

final getIt = GetIt.instance;

final mdtApiClient = getIt<MdtApiClient>();
final mdtAuthClient = getIt<MdtAuthClient>();
final mdtPasswordClient = getIt<MdtPasswordClient>();
final authService = getIt<AuthService>();
