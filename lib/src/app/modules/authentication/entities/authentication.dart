import 'package:procraft/src/app/modules/authentication/enums/account_status.dart';
import 'package:procraft/src/app/modules/authentication/enums/user_role.dart';

class Authentication {
  final String email;
  final String token;
  final UserRole role;
  final AccountStatus accountStatus;
  final String userId;

  Authentication({
    required this.email,
    required this.token,
    required this.role,
    required this.accountStatus,
    required this.userId,
  });

  factory Authentication.fromMap(Map<String, dynamic> map) {
    return Authentication(
      email: map['email'],
      token: map['token'],
      role: extractUserRole(map['role']),
      accountStatus: extractAccountStatus(map['accountStatus']),
      userId: map['userId'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'token': token,
      'role': role.index,
      'accountStatus': accountStatus.index,
      'userId': userId,
    };
  }

  static UserRole extractUserRole(int role) {
    switch (role) {
      case 0:
        return UserRole.user;
      case 1:
        return UserRole.admin;
      default:
        return UserRole.user;
    }
  }

  static AccountStatus extractAccountStatus(int status) {
    switch (status) {
      case 0:
        return AccountStatus.basic;
      case 1:
        return AccountStatus.pro;
      case 2:
        return AccountStatus.premmium;
      default:
        return AccountStatus.basic;
    }
  }
}
