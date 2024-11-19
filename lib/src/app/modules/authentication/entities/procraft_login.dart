// ignore_for_file: public_member_api_docs, sort_constructors_first

class ProcraftLogin {
  String email;
  String password;

  ProcraftLogin({required this.email, required this.password});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

  factory ProcraftLogin.fromMap(Map<String, dynamic> map) {
    return ProcraftLogin(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }
}
