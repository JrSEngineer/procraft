import 'package:procraft/src/app/modules/processes/enum/progess.dart';

class ProcraftProcess {
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
