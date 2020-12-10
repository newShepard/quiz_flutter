import 'package:quiz_flutter/models/mdt_api/principal.dart';
import 'package:quiz_flutter/models/mdt_api/user.dart';

class QuizUser with AbstractMdtApiUser, AbstractMdtApiPrincipal {
  QuizUser._();
  factory QuizUser.create(MdtApiUser mdtUser, MdtApiPrincipal mdtPrincipal) {
    return QuizUser._()
      ..id = mdtUser.id
      ..fullName = mdtUser.fullName
      ..email = mdtUser.email
      ..identityName = mdtUser.identityName
      ..isAdmin = mdtUser.isAdmin
      ..isAnonymous = mdtUser.isAnonymous
      ..roles = mdtUser.roles
      ..languageId = mdtUser.languageId
      ..isImpersonated = mdtUser.isImpersonated
      ..flagAdmin = mdtPrincipal.flagAdmin
      ..flagGetlog = mdtPrincipal.flagGetlog
      ..flagRouteExsits = mdtPrincipal.flagRouteExsits
      ..flagSuperVisor = mdtPrincipal.flagSuperVisor
      ..employee = mdtPrincipal.employee
      ..userSettings = mdtPrincipal.userSettings;
  }
}
