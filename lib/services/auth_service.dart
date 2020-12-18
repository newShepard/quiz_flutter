import 'package:quiz_flutter/api/mdt_api_client.dart';
import 'package:quiz_flutter/api/mdt_auth_client.dart';
import 'package:quiz_flutter/api/mdt_filter_helper.dart';
import 'package:quiz_flutter/api/mdt_password_client.dart';
import 'package:quiz_flutter/helpers/dependecy_injector.dart';
import 'package:quiz_flutter/models/mdt_api/principal.dart';
import 'package:quiz_flutter/models/mdt_api/query.dart';
import 'package:quiz_flutter/models/mdt_api/user.dart';
import 'package:quiz_flutter/models/quiz/user.dart';
import 'package:meta/meta.dart';

const QUIZ_GROUPS = ["Questionnaire", "QuestionnaireAdministrator"];
typedef Future<void> AuthServuceInitCb(QuizUser user);

class AuthServiceOptions {
  AuthServuceInitCb init;
  AuthServiceOptions({this.init});
}

class AuthService {
  MdtApiClient _mdtApiClient;
  MdtAuthClient _mdtAuthClient;
  MdtPasswordClient _mdtPasswordClient;

  QuizUser user;
  AuthService() {
    this._mdtApiClient = sl<MdtApiClient>();
    this._mdtAuthClient = sl<MdtAuthClient>();
    this._mdtPasswordClient = sl<MdtPasswordClient>();
    this.user = null;
  }

  Future<QuizUser> initUser() async {
    var mdtUser = await this._mdtAuthClient.getMdtUser();
    MdtApiPrincipal mdtPrincipal;
    if (this.isUserLoggedIn(mdtUser)) {
      mdtPrincipal = await this.getMdtPrincipal(mdtUser.id);
    }
    //await userService.updateUserSettings
    return QuizUser.create(mdtUser, mdtPrincipal);
  }

  Future<void> signIn(
      {@required String login, @required String password}) async {
    await this
        ._mdtAuthClient
        .signIn(login: login, password: password, rememberMe: true);
    await this.initUser();
  }

  Future<void> signOut() async {
    await this._mdtAuthClient.signOut();
    await this.initUser();
  }

  Future<void> forgotPassword({@required String login}) async {
    await this._mdtPasswordClient.sendForgotPassword(login: login);
  }

  Future<void> setPassword() async {}

  Future<void> changePassword() async {}

  bool isSupervisor() {
    return this.user.flagSuperVisor;
  }

  bool hasAccessToQuiz() {
    var user = this.user;
    return user?.roles?.any((role) => QUIZ_GROUPS.contains(role)) ??
        user.isAdmin;
  }

  bool isUserLoggedIn(MdtApiUser user) {
    return user.isAnonymous == false;
  }

  Future<void> getLoginData() async {
    //
  }

  Future<void> registerUser() async {}

  Future<MdtApiPrincipal> getMdtPrincipal(int userId) async {
    return await this
        ._mdtApiClient
        .fetch(
          query: Query(
            table: 'qst.PrincipalCache',
            filter: FilterHelper.eq('ID', userId),
            select: [
              'FlagAdmin',
              'FlagGetLog',
              'FlagRouteExists',
              'FlagSuperVisor',
              'ID_Position',
              'ID_Employee/*',
              'ID_UserSettings/*'
            ],
          ),
        )
        .then((value) {
      var val = value.records[0];
      return MdtApiPrincipal.fromJson(val);
    });
  }
}
