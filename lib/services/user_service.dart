import 'package:quiz_flutter/api/mdt_api_client.dart';
import 'package:quiz_flutter/api/mdt_auth_module.dart';
import 'package:quiz_flutter/models/quiz/user.dart';

class UserService {
  QuizUser? user;
  MdtApiClient mdtApiClient;
  MdtAuthClient mdtAuthModule;
  late bool privacyPolicyAccepted;

  UserService({required this.mdtApiClient, required this.mdtAuthModule}) {
    this.privacyPolicyAccepted = true;
  }

  // add events

  void log() {}

  void savePrivacyPolicyAcceptLocaly() {}

  bool get privacyPolicyIsAccepted => this.privacyPolicyAccepted;

  Future<void> init() async {}

  Future<void> checkPrivacyPolicy() async {}

  Future<void> savePrivacyPolicyAcceptToServer() async {}

  Future<void> prepareLogData() async {}

  Future<void> changeLanguage({required int langId}) async {}

  Future<void> updateUserSettings(QuizUser? user) async {}
}
