import 'package:procraft/src/app/modules/authentication/entities/authentication.dart';
import 'package:procraft/src/app/modules/authentication/enums/account_status.dart';
import 'package:procraft/src/app/modules/authentication/enums/user_role.dart';

class NewAuthentication {
  String email;
  String password;
  String confirmationPassword;
  UserRole role;
  AccountStatus accountStatus;

  NewAuthentication({
    required this.email,
    required this.password,
    this.confirmationPassword = '',
    this.role = UserRole.user,
    this.accountStatus = AccountStatus.basic,
  });

  factory NewAuthentication.fromMap(Map<String, dynamic> map) {
    return NewAuthentication(
      email: map['email'],
      password: map['password'],
      role: Authentication.extractUserRole(map['role']),
      accountStatus: Authentication.extractAccountStatus(map['acc/ountStatus']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'role': role.index,
      'accountStatus': accountStatus.index,
    };
  }
}
