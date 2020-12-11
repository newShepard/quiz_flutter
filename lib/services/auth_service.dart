import 'package:quiz_flutter/api/mdt_api_client.dart';
import 'package:quiz_flutter/api/mdt_filter_helper.dart';
import 'package:quiz_flutter/models/mdt_api/principal.dart';
import 'package:quiz_flutter/models/mdt_api/query.dart';
import 'package:quiz_flutter/models/mdt_api/user.dart';
import 'package:quiz_flutter/models/quiz/user.dart';

typedef Future<void>? AuthServuceInitCb(QuizUser user);

class AuthServiceOptions {
  AuthServuceInitCb? init;
  AuthServiceOptions({this.init});
}

class AuthService {
  MdtApiClient mdtApiClient;
  AuthServiceOptions? options;
  QuizUser? user;
  AuthService({required this.mdtApiClient, this.options}) {
    this.user = null;
  }

  Future<void> init() async {
    var mdtUser = await this.mdtApiClient.auth.user();
    // QuizUser? userData = QuizUser.create(mdtUser, MdtApiPrincipal());
    // if (this.isUserLoggedIn(userData)) {
    //   //userData = await getPrincipal(mdtUser.id);
    // }
  }

  Future<void> signIn({required String login, required String password}) async {
    await this
        .mdtApiClient
        .auth
        .signIn(login: login, password: password, rememberMe: true);
    await this.init();
  }

  Future<void> signOut() async {
    await this.mdtApiClient.auth.signOut();
    await this.init();
  }

  Future<void> forgotPassword({required String login}) async {
    await this.mdtApiClient.password.sendForgotPassword(login: login);
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

  Future<MdtApiPrincipal> getPrincipal(int? userId) async {
    return await this
        .mdtApiClient
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
      var val = value.records?[0];
      return MdtApiPrincipal.fromJson(val);
    });
  }
}
