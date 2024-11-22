// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:procraft/src/app/modules/processes/entities/procraft_process.dart';
import 'package:procraft/src/app/modules/processes/enum/progess.dart';

class UpdateProcess {
  String title;
  String description;
  Progress progress;

  UpdateProcess({
    required this.title,
    required this.description,
    required this.progress,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'progress': progress.index,
    };
  }

  factory UpdateProcess.fromMap(Map<String, dynamic> map) {
    return UpdateProcess(
      title: map['title'] as String,
      description: map['description'] as String,
      progress: ProcraftProcess.extractProgress(map['progress']),
    );
  }
}
