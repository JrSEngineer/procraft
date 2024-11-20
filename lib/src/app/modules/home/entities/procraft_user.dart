import 'package:procraft/src/app/modules/authentication/entities/authentication.dart';
import 'package:procraft/src/app/modules/home/entities/address.dart';
import 'package:procraft/src/app/modules/home/entities/user_involved_process.dart';

class ProcraftUser {
  final String id;
  final String profileImage;
  final String fullName;
  final String description;
  final String phoneNumber;
  final String cpf;
  final Address address;
  final Authentication authentication;
  final List<UserInvolvedProcess> processes;

  ProcraftUser({
    required this.id,
    required this.profileImage,
    required this.fullName,
    required this.description,
    required this.phoneNumber,
    required this.cpf,
    required this.address,
    required this.authentication,
    this.processes = const <UserInvolvedProcess>[],
  });

  factory ProcraftUser.fromMap(Map<String, dynamic> map) {
    var processesMaps = map['processes'] as List;
    var processes = processesMaps.map((processMap) => UserInvolvedProcess.fromMap(processMap)).toList();

    return ProcraftUser(
      id: map['id'],
      profileImage: map['profileImage'].isEmpty ? "https://picsum.photos/200/300" : map['profileImage'],
      fullName: map['fullName'],
      description: map['description'],
      phoneNumber: map['phoneNumber'],
      cpf: map['cpf'],
      address: Address.fromMap(map['address']),
      authentication: Authentication.fromMap(map['authentication']),
      processes: processes,
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
      'processes': processes.map((process) => process.toMap()).toList(),
    };
  }
}
