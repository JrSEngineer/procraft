import 'package:procraft/src/app/modules/authentication/entities/new_user.dart';
import 'package:procraft/src/app/modules/authentication/entities/procraft_login.dart';
import 'package:procraft/src/app/modules/home/entities/procraft_user.dart';

abstract class IAuthenticationRepository {
  Future<ProcraftUser?> signIn(ProcraftLogin login);
  Future<ProcraftUser?> register(NewUser newUser);
}
