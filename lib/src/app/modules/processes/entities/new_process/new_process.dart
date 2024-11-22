// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:procraft/src/app/modules/processes/entities/new_process/new_process_scope.dart';
import 'package:procraft/src/app/modules/processes/entities/new_process/new_process_step.dart';
import 'package:procraft/src/app/modules/processes/entities/new_process/new_process_user.dart';
import 'package:procraft/src/app/modules/processes/enum/progess.dart';

class NewProcess {
  String id;
  String title;
  String description;
  Progress progress;
  DateTime startForecast;
  DateTime finishForecast;
  List<NewProcessUser> users;
  NewProcessScope? scope;
  List<NewProcessStep> steps;

  NewProcess({
    required this.id,
    required this.title,
    required this.description,
    required this.progress,
    required this.startForecast,
    required this.finishForecast,
    this.scope,
    required this.users,
    required this.steps,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'progress': progress.index,
      'startForecast': startForecast.millisecondsSinceEpoch,
      'finishForecast': finishForecast.millisecondsSinceEpoch,
      'scope': scope?.toMap(),
      'users': users.map((user) => user.toMap()).toList(),
      'steps': steps.map((step) => step.toMap()).toList(),
    };
  }
}