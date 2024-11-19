
class NewAuthentication {
  final String email;
  final String password;
  final int role;
  final int accountStatus;

  NewAuthentication({
    required this.email,
    required this.password,
    required this.role,
    required this.accountStatus,
  });

  factory NewAuthentication.fromMap(Map<String, dynamic> map) {
    return NewAuthentication(
      email: map['email'],
      password: map['password'],
      role: map['role'],
      accountStatus: map['accountStatus'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'role': role,
      'accountStatus': accountStatus,
    };
  }
}