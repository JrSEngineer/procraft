import 'package:procraft/src/app/modules/home/entities/user_involved_process.dart';
import 'package:procraft/src/app/modules/processes/entities/new_process/new_process.dart';
import 'package:procraft/src/app/modules/processes/entities/procraft_process.dart';
import 'package:procraft/src/app/modules/processes/entities/update_process/udpate_process.dart';

abstract class IProcessesRepository {
  Future<ProcraftProcess> createProcess(NewProcess newProcess);
  Future<List<UserInvolvedProcess>> getUserProcesses(String userId);
  Future<ProcraftProcess> getProcessById(String id);
  Future<ProcraftProcess> updateProcess(String id, UpdateProcess process);
  Future<void> deleteProcess(String id);
}
