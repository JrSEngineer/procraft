// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:procraft/src/app/modules/processes/enum/progess.dart';

class ProcraftProcess {
  String id;
  String title;
  String description;
  Progress progress;
  DateTime startForecast;
  DateTime finishForecast;
  DateTime startedAt;
  DateTime finishedAt;
  ProcessScope scope;
  List<ProcessStep> steps;
  
  ProcraftProcess({
    required this.id,
    required this.title,
    required this.description,
    required this.progress,
    required this.startForecast,
    required this.finishForecast,
    required this.startedAt,
    required this.finishedAt,
    required this.scope,
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
}

class ProcessScope {}

class ProcessStep {}
