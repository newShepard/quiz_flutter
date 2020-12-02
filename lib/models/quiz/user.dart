import 'package:quiz_flutter/models/mdt_api/user.dart';
import '../common.dart';
import 'employee.dart';

class UserSettings extends Recordable {
  bool? flagAcceptPrivacyPolicy;
  bool? id_mdt_Principal;
}

class UserData extends MdtApiUser {
  bool? flagAdmin;
  bool? flagGetlog;
  bool? flagRouteExsits;
  bool? isSuperVisor;
  Employee? employee;
  UserSettings? userSettings;

  UserData(
      {this.flagAdmin,
      this.flagGetlog,
      this.flagRouteExsits,
      this.isSuperVisor,
      this.employee,
      this.userSettings});
}
