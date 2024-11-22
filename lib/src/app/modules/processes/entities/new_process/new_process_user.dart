class NewProcessUser {
  String userId;

  NewProcessUser({required this.userId});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
    };
  }

  factory NewProcessUser.fromMap(Map<String, dynamic> map) {
    return NewProcessUser(
      userId: map['userId'] as String,
    );
  }
}
