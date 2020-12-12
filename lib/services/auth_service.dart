import 'package:quiz_flutter/api/mdt_api_client.dart';
import 'package:quiz_flutter/api/mdt_auth_client.dart';
import 'package:quiz_flutter/api/mdt_filter_helper.dart';
import 'package:quiz_flutter/api/mdt_password_client.dart';
import 'package:quiz_flutter/helpers/dependecy_injector.dart' as di;
import 'package:quiz_flutter/models/mdt_api/principal.dart';
import 'package:quiz_flutter/models/mdt_api/query.dart';
import 'package:quiz_flutter/models/quiz/user.dart';

typedef Future<void>? AuthServuceInitCb(QuizUser user);

class AuthServiceOptions {
  AuthServuceInitCb? init;
  AuthServiceOptions({this.init});
}

class AuthService {
  late final MdtApiClient _mdtApiClient;
  late final MdtAuthClient _mdtAuthClient;
  late final MdtPasswordClient _mdtPasswordClient;
  //AuthServiceOptions? options;
  QuizUser? user;
  AuthService() {
    this._mdtApiClient = di.mdtApiClient;
    this._mdtAuthClient = di.mdtAuthClient;
    this._mdtPasswordClient = di.mdtPasswordClient;
    this.user = null;
  }

  Future<void> init() async {
    var mdtUser = await this._mdtAuthClient.getMdtUser();
    // QuizUser? userData = QuizUser.create(mdtUser, MdtApiPrincipal());
    // if (this.isUserLoggedIn(userData)) {
    //   //userData = await getPrincipal(mdtUser.id);
    // }
  }

  Future<void> signIn({required String login, required String password}) async {
    await this
        ._mdtAuthClient
        .signIn(login: login, password: password, rememberMe: true);
    await this.init();
  }

  Future<void> signOut() async {
    await this._mdtAuthClient.signOut();
    await this.init();
  }

  Future<void> forgotPassword({required String login}) async {
    await this._mdtPasswordClient.sendForgotPassword(login: login);
  }

  Future<void> setPassword() async {}

  Future<void> changePassword() async {}

  bool? isLoggedIn() {
    return this.isUserLoggedIn(this.user);
  }

  bool? isSupervisor() {
    return this.user?.flagSuperVisor;
  }

  bool? hasAccessToQuiz() {
    var user = this.user;
    //return user?.roles.any((element) => false)
    return true;
  }

  bool? isUserLoggedIn(QuizUser? user) {
    return user?.isAnonymous == false;
  }

  Future<void> getLoginData() async {
    //
  }

  Future<void> registerUser() async {}

  Future<MdtApiPrincipal> getMdtPrincipal(int? userId) async {
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
