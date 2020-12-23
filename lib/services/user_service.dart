import 'package:quiz_flutter/api/mdt_api_client.dart';
import 'package:quiz_flutter/api/mdt_auth_client.dart';
import 'package:quiz_flutter/helpers/dependecy_injector.dart';
import 'package:quiz_flutter/models/quiz/user.dart';
import 'package:meta/meta.dart';
import 'package:quiz_flutter/services/auth_service.dart';

class UserService {
  QuizUser _user;
  MdtApiClient _mdtApiClient;
  MdtAuthClient _mdtAuthClient;
  AuthService _authService;
  bool _privacyPolicyAccepted;

  UserService() {
    _privacyPolicyAccepted = true;
    _mdtApiClient = sl<MdtApiClient>();
    _mdtAuthClient = sl<MdtAuthClient>();
    _authService = sl<AuthService>();
  }

  QuizUser get user => _user;

  bool get privacyPolicyIsAccepted => _privacyPolicyAccepted;

  Future<void> init() async {
    _user = await _authService.initUser();
    // this._log();
  }

  Future<void> checkPrivacyPolicy() async {}

  Future<void> savePrivacyPolicyAcceptToServer() async {}

  Future<void> prepareLogData() async {}

  Future<void> changeLanguage({@required int langId}) async {}

  Future<void> updateUserSettings(QuizUser user) async {}

  Future<void> _log() async {}

  Future<void> _savePrivacyPolicyAcceptLocaly() async {}
}
