// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:procraft/src/app/modules/processes/entities/process/process_member.dart';
import 'package:procraft/src/app/modules/processes/entities/process/process_scope.dart';
import 'package:procraft/src/app/modules/processes/entities/process/process_step.dart';
import 'package:procraft/src/app/modules/processes/enum/progess.dart';

class ProcraftProcess {
  String id;
  String title;
  String description;
  Progress progress;
  DateTime startForecast;
  DateTime finishForecast;
  DateTime? startedAt;
  DateTime? finishedAt;
  List<ProcessMember> users;
  ProcessScope? scope;
  List<ProcessStep> steps;

  ProcraftProcess({
    required this.id,
    required this.title,
    required this.description,
    required this.progress,
    required this.startForecast,
    required this.finishForecast,
    this.startedAt,
    this.finishedAt,
    this.scope,
    required this.users,
    required this.steps,
  });

  static Progress extractProgress(int progress) {
    switch (progress) {
      case 0:
        return Progress.created;
      case 1:
        return Progress.started;
      case 2:
        return Progress.finished;
      default:
        return Progress.created;
    }
  }

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
      'users': users.map((x) => x.toMap()).toList(),
      'scope': scope?.toMap(),
      'steps': steps.map((x) => x.toMap()).toList(),
    };
  }

  factory ProcraftProcess.fromMap(Map<String, dynamic> map) {
    return ProcraftProcess(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      progress: extractProgress(map['progress']),
      startForecast: DateTime.parse(map['startForecast']),
      finishForecast: DateTime.parse(map['finishForecast']),
      startedAt: map['startedAt'] != null ? DateTime.parse(map['startedAt']) : null,
      finishedAt: map['finishedAt'] != null ? DateTime.parse(map['finishedAt']) : null,
      users: List<ProcessMember>.from(
        (map['users'] as List<int>).map<ProcessMember>(
          (x) => ProcessMember.fromMap(x as Map<String, dynamic>),
        ),
      ),
      scope: map['scope'] != null ? ProcessScope.fromMap(map['scope'] as Map<String, dynamic>) : null,
      steps: List<ProcessStep>.from(
        (map['steps'] as List<int>).map<ProcessStep>(
          (x) => ProcessStep.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
