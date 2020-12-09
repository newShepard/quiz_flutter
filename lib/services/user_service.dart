import 'package:quiz_flutter/api/mdt_api_client.dart';
import 'package:quiz_flutter/api/mdt_auth_module.dart';
import 'package:quiz_flutter/models/quiz/user.dart';

class UserService {
  QuizUser? user;
  late bool privacyPolicyAccepted;
  MdtApiClient mdtApiClient;
  MdtAuthModule mdtAuthModule;

  UserService({required this.mdtApiClient, required this.mdtAuthModule}) {
    this.privacyPolicyAccepted = true;
  }
}
