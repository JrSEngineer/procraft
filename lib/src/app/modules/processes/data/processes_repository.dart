import 'dart:io';

import 'package:dio/dio.dart';
import 'package:procraft/src/app/modules/home/entities/user_involved_process.dart';
import 'package:procraft/src/app/modules/processes/entities/new_process/new_process.dart';
import 'package:procraft/src/app/modules/processes/entities/procraft_process.dart';
import 'package:procraft/src/app/modules/processes/entities/update_process/udpate_process.dart';
import 'package:procraft/src/app/modules/processes/interfaces/iprocesses_repository.dart';
import 'package:procraft/src/app/shared/http/interceptors/authentcation_interceptor.dart';

class ProcessesRepository implements IProcessesRepository {
  ProcessesRepository(this._dio) {
    _dio.interceptors.add(AuthenticationInterceptor());
  }

  final Dio _dio;

  @override
  Future<ProcraftProcess> createProcess(NewProcess newProcess) async {
    try {
      final response = await _dio.post('/processes', data: newProcess.toMap());

      if (response.statusCode != HttpStatus.created) {
        throw Exception('Erro ao criar novo processo');
      }

      final processMap = response.data as Map<String, dynamic>;

      final process = ProcraftProcess.fromMap(processMap);

      return process;
    } catch (e) {
      throw Exception('Erro ao criar novo processo');
    }
  }

  @override
  Future<ProcraftProcess> getProcessById(String id) async {
    try {
      final response = await _dio.get('/processes/$id');

      if (response.statusCode != HttpStatus.ok) {
        throw Exception('Erro ao obter processo pelo identificador $id');
      }

      final processMap = response.data as Map<String, dynamic>;

      final process = ProcraftProcess.fromMap(processMap);

      return process;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<UserInvolvedProcess>> getUserProcesses(String userId) async {
    try {
      final response = await _dio.get('/users/$userId//processes');

      if (response.statusCode != HttpStatus.ok) {
        throw Exception('Erro ao obter processos do usuário.');
      }

      final processesList = response.data as List;

      final processes = processesList.map((process) => UserInvolvedProcess.fromMap(process)).toList();

      return processes;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProcraftProcess> updateProcess(String id, UpdateProcess process) async {
    try {
      final response = await _dio.patch('/processes/$id', data: process.toMap());

      if (response.statusCode != HttpStatus.ok) {
        throw Exception('Erro ao atualizar processo com id $id.');
      }

      final processMap = response.data as Map<String, dynamic>;

      final updatedProcess = ProcraftProcess.fromMap(processMap);

      return updatedProcess;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteProcess(String id) async {
    try {
      final response = await _dio.delete('/processes/$id');

      if (response.statusCode != HttpStatus.noContent) {
        throw Exception('Falha ao deletar o processo com $id.');
      }
    } catch (e) {
      rethrow;
    }
  }
}
