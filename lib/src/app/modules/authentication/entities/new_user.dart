import 'package:procraft/src/app/modules/authentication/entities/new_address.dart';
import 'package:procraft/src/app/modules/authentication/entities/new_authentication.dart';

class NewUser {
  final String fullName;
  final String profileImage;
  final String description;
  final String phoneNumber;
  final String cpf;
  final NewAuthentication authentication;
  final NewAddress address;

  NewUser({
    required this.fullName,
    required this.profileImage,
    required this.description,
    required this.phoneNumber,
    required this.cpf,
    required this.authentication,
    required this.address,
  });

  factory NewUser.fromMap(Map<String, dynamic> map) {
    return NewUser(
      fullName: map['fullName'],
      profileImage: map['profileImage'],
      description: map['description'],
      phoneNumber: map['phoneNumber'],
      cpf: map['cpf'],
      authentication: NewAuthentication.fromMap(map['authentication']),
      address: NewAddress.fromMap(map['address']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'profileImage': profileImage,
      'description': description,
      'phoneNumber': phoneNumber,
      'cpf': cpf,
      'authentication': authentication.toMap(),
      'address': address.toMap(),
    };
  }
}