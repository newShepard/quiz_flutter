import 'package:quiz_flutter/api/mdt_api_client.dart';
import 'package:quiz_flutter/api/mdt_filter_helper.dart';
import 'package:quiz_flutter/features/authentification/data/models/mdt_api_principal_model.dart';
import 'package:quiz_flutter/models/mdt_api/query.dart';
import 'package:meta/meta.dart';

abstract class IAuthDataSource {
  // Future<QuizUser> initUser();
  // Future<void> signIn({@required String login, @required String password});
  // Future<void> signOut();
  // Future<void> forgotPassword({@required String login});
  // Future<void> setPassword();
  // Future<void> changePassword();
  // bool isSupervisor();
  // bool hasAccessToQuiz();
  // bool isUserLoggedIn(MdtApiUser user);
  // Future<void> getLoginData();
  // Future<void> registerUser();
  Future<MdtApiPrincipal> getMdtPrincipal(int userId);
}

class AuthDataSource implements IAuthDataSource {
  final MdtApiClient mdtApiClient;

  AuthDataSource({@required this.mdtApiClient});

  @override
  Future<MdtApiPrincipal> getMdtPrincipal(int userId) async {
    return await mdtApiClient
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
