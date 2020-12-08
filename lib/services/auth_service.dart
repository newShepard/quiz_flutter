import 'package:quiz_flutter/api/mdt_api_client.dart';
import 'package:quiz_flutter/api/mdt_filter_helper.dart';
import 'package:quiz_flutter/models/mdt_api/fetch.dart';
import 'package:quiz_flutter/models/mdt_api/query.dart';
import 'package:quiz_flutter/models/mdt_api/user.dart';
import 'package:quiz_flutter/models/quiz/employee.dart';
import 'package:quiz_flutter/models/quiz/user.dart';

typedef Future<void>? AuthServuceInitCb(UserData user);

class AuthServiceOptions {
  AuthServuceInitCb? init;
  AuthServiceOptions({this.init});
}

class AuthService {
  MdtApiClient mdtApiClient;
  AuthServiceOptions? options;
  UserData? user;
  AuthService({required this.mdtApiClient, this.options}) {
    this.user = null;
  }

  Future<void> init() async {
    var mdtUser = await this.mdtApiClient.auth.user();
    UserData? userData = null;
    if (this.isUserLoggedIn(mdtUser)) {
      userData = await getUserData(mdtUser.id);
    }
  }

  bool isUserLoggedIn(MdtApiUser user) {
    return user.isAnonymous == false;
  }

  Future<UserData> getUserData(int? userId) async {
    var response = await this
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
      print('getUserData: ${value}');
      return null;
    });
    //var result = response?.records?[0] ?? "nothing";
    return Future.value(UserData(
        flagAdmin: true,
        flagGetlog: false,
        employee: Employee(positionName: 'customer')));
  }
}
