import 'package:procraft/src/app/modules/processes/entities/process/process_action.dart';
import 'package:procraft/src/app/modules/processes/entities/process/process_step.dart';

class ProcessMember {
  String id;
  String profileImage;
  String fullName;
  String description;
  String phoneNumber;
  String cpf;
  List<ProcessAction>? actions;
  List<ProcessStep>? steps;

  ProcessMember({
    required this.id,
    required this.profileImage,
    required this.fullName,
    required this.description,
    required this.phoneNumber,
    required this.cpf,
    this.actions,
    this.steps,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'profileImage': profileImage,
      'fullName': fullName,
      'description': description,
      'phoneNumber': phoneNumber,
      'cpf': cpf,
      'actions': actions?.map((action) => action.toMap()).toList(),
      'steps': steps?.map((step) => step.toMap()).toList(),
    };
  }

  factory ProcessMember.fromMap(Map<String, dynamic> map) {
    return ProcessMember(
      id: map['id'] as String,
      profileImage: map['profileImage'] as String,
      fullName: map['fullName'] as String,
      description: map['description'] as String,
      phoneNumber: map['phoneNumber'] as String,
      cpf: map['cpf'] as String,
      actions: map['actions'] != null
          ? List<ProcessAction>.from(
              (map['actions'] as List).map<ProcessAction?>(
                (x) => ProcessAction.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      steps: map['steps'] != null
          ? List<ProcessStep>.from(
              (map['steps'] as List).map<ProcessStep?>(
                (x) => ProcessStep.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }
}
