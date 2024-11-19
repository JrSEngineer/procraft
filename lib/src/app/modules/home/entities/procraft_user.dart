import 'package:procraft/src/app/modules/authentication/entities/authentication.dart';
import 'package:procraft/src/app/modules/home/entities/address.dart';

class ProcraftUser {
  final String id;
  final String profileImage;
  final String fullName;
  final String description;
  final String phoneNumber;
  final String cpf;
  final Address address;
  final Authentication authentication;

  ProcraftUser({
    required this.id,
    required this.profileImage,
    required this.fullName,
    required this.description,
    required this.phoneNumber,
    required this.cpf,
    required this.address,
    required this.authentication,
  });

  factory ProcraftUser.fromMap(Map<String, dynamic> map) {
    return ProcraftUser(
      id: map['id'],
      profileImage: map['profileImage'],
      fullName: map['fullName'],
      description: map['description'],
      phoneNumber: map['phoneNumber'],
      cpf: map['cpf'],
      address: Address.fromMap(map['address']),
      authentication: Authentication.fromMap(map['authentication']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'profileImage': profileImage,
      'fullName': fullName,
      'description': description,
      'phoneNumber': phoneNumber,
      'cpf': cpf,
      'address': address.toMap(),
      'authentication': authentication.toMap(),
    };
  }
}
