import 'package:procraft/src/app/modules/processes/entities/procraft_process.dart';
import 'package:procraft/src/app/modules/processes/enum/progess.dart';

class ProcessAction {
  String id;
  String userId;
  String stepId;
  String title;
  String description;
  Progress progress;
  DateTime startForecast;
  DateTime finishForecast;
  DateTime? startedAt;
  DateTime? finishedAt;

  ProcessAction({
    required this.id,
    required this.userId,
    required this.stepId,
    required this.title,
    required this.description,
    required this.progress,
    required this.startForecast,
    required this.finishForecast,
    this.startedAt,
    this.finishedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'stepId': stepId,
      'title': title,
      'description': description,
      'progress': progress.index,
      'startForecast': startForecast.millisecondsSinceEpoch,
      'finishForecast': finishForecast.millisecondsSinceEpoch,
      'startedAt': startedAt?.millisecondsSinceEpoch,
      'finishedAt': finishedAt?.millisecondsSinceEpoch,
    };
  }

  factory ProcessAction.fromMap(Map<String, dynamic> map) {
    return ProcessAction(
      id: map['id'] as String,
      userId: map['userId'] as String,
      stepId: map['stepId'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      progress: ProcraftProcess.extractProgress(map['progress']),
      startForecast: DateTime.fromMillisecondsSinceEpoch(map['startForecast'] as int),
      finishForecast: DateTime.fromMillisecondsSinceEpoch(map['finishForecast'] as int),
      startedAt: map['startedAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['startedAt'] as int) : null,
      finishedAt: map['finishedAt'] != null ? DateTime.fromMillisecondsSinceEpoch(map['finishedAt'] as int) : null,
    );
  }
}
