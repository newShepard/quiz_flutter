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
    QuizUser? userData = null;
    if (this.isUserLoggedIn(mdtUser)) {
      //userData = await getPrincipal(mdtUser.id);
    }
  }

  bool isUserLoggedIn(MdtApiUser user) {
    return user.isAnonymous == false;
  }

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
        .then((value) => MdtApiPrincipal.fromJson(value.records?[0]));
  }
}
