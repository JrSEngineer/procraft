class Authentication {
  final String email;
  final String token;
  final int role;
  final int accountStatus;
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
      role: map['role'],
      accountStatus: map['accountStatus'],
      userId: map['userId'],
    );
  }

  Map<String, dynamic> tomap() {
    return {
      'email': email,
      'token': token,
      'role': role,
      'accountStatus': accountStatus,
      'userId': userId,
    };
  }
}