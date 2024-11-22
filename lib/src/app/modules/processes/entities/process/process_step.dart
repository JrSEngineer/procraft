import 'package:procraft/src/app/modules/processes/entities/process/process_action.dart';
import 'package:procraft/src/app/modules/processes/entities/process/process_member.dart';
import 'package:procraft/src/app/modules/processes/entities/procraft_process.dart';
import 'package:procraft/src/app/modules/processes/enum/progess.dart';

class ProcessStep {
  String id;
  String title;
  String description;
  Progress progress;
  DateTime startForecast;
  DateTime finishForecast;
  DateTime? startedAt;
  DateTime? finishedAt;
  List<ProcessMember>? users;
  List<ProcessAction>? actions;

  ProcessStep({
    required this.id,
    required this.title,
    required this.description,
    required this.progress,
    required this.startForecast,
    required this.finishForecast,
    this.startedAt,
    this.finishedAt,
    this.users,
    this.actions,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'progress': progress.index,
      'startForecast': startForecast.millisecondsSinceEpoch,
      'finishForecast': finishForecast.millisecondsSinceEpoch,
      'startedAt': startedAt?.millisecondsSinceEpoch,
      'finishedAt': finishedAt?.millisecondsSinceEpoch,
      'users': users?.map((user) => user.toMap()).toList() ?? [],
      'actions': actions?.map((action) => action.toMap()).toList() ?? [],
    };
  }

  factory ProcessStep.fromMap(Map<String, dynamic> map) {
    return ProcessStep(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      progress: ProcraftProcess.extractProgress(map['progress']),
      startForecast: DateTime.parse(map['startForecast']),
      finishForecast: DateTime.parse(map['finishForecast']),
      startedAt: map['startedAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['startedAt'] as int) : null,
      finishedAt: map['finishedAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['finishedAt'] as int) : null,
      users: map['users'] != null
          ? List<ProcessMember>.from(
              (map['users'] as List).map<ProcessMember?>(
                (x) => ProcessMember.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      actions: map['actions'] != null
          ? List<ProcessAction>.from(
              (map['actions'] as List).map<ProcessAction?>(
                (x) => ProcessAction.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }
}
