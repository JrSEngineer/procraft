// ignore_for_file: use_build_context_synchronously, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:procraft/src/app/modules/home/entities/user_involved_process.dart';
import 'package:procraft/src/app/modules/processes/enum/progess.dart';
import 'package:procraft/src/app/modules/processes/interfaces/iprocesses_repository.dart';
import 'package:procraft/src/app/shared/utils/procraft_snackbar.dart';

class ProcessStore extends ValueNotifier<List<UserInvolvedProcess>> {
  ProcessStore(this._repository) : super([]);

  final IProcessesRepository _repository;

  List<UserInvolvedProcess> _processesPlaceholder = [];

  bool _loading = false;

  bool get loading => _loading;

  bool _taggedValue = false;

  bool get taggedValue => _taggedValue;

  String _tag = '';

  String _filter = '';

  ValueNotifier<bool> overalTagSelected = ValueNotifier(true);

  ValueNotifier<bool> startedProcessTagSelected = ValueNotifier(false);

  ValueNotifier<bool> finishedProcessSelected = ValueNotifier(false);

  Future<void> getUserProcesses(BuildContext context, String userId) async {
    try {
      value.clear();

      _processesPlaceholder.clear();

      _setLoadingValue(true);

      final userProcesses = await _repository.getUserProcesses(userId);

      value.addAll(userProcesses);

      _processesPlaceholder.addAll(userProcesses);

      _setLoadingValue(false);
    } catch (e) {
      onFailure(context, 'Não foi possível obter os processos. Erro durante comunicação com o servidor.');

      _setLoadingValue(false);
    }
  }

  void applyFilterInProcessesList(String? filter) {
    if (filter != null && filter.isNotEmpty) {
      _setLoadingValue(true);

      _filter = filter;

      value.clear();

      value.addAll(_processesPlaceholder);

      final filteredProcesses = value.where((process) {
        final filterValue = _filter.toLowerCase();
        return process.title.toLowerCase().contains(filterValue) || //
            process.description.toLowerCase().contains(filterValue);
      }).toList();

      value.clear();

      value.addAll(filteredProcesses);

      _setLoadingValue(false);
    } else {
      _setLoadingValue(true);

      _filter = '';

      value.clear();

      value.addAll(_processesPlaceholder);

      _setLoadingValue(false);
    }
  }

  void applyFilterInProcessesListWithTagValue(String? filter) {

    _filter = filter ?? '';

    final taggedProcessesList = _processesPlaceholder.where((process) => process.progress.name.toLowerCase().contains(_tag.toLowerCase())).toList();

    if (_filter.isNotEmpty) {
      _setLoadingValue(true);

      value.clear();

      value.addAll(_processesPlaceholder);

      final filteredProcesses = taggedProcessesList.where((process) {
        final filterValue = _filter.toLowerCase();
        final tagValue = _tag.toLowerCase();
        return process.title.toLowerCase().contains(filterValue) || //
            process.description.toLowerCase().contains(filterValue) && //
                process.progress.name.toLowerCase().contains(tagValue);
      }).toList();

      value.clear();

      value.addAll(filteredProcesses);

      _setLoadingValue(false);
    } else {
      _setLoadingValue(true);

      _filter = '';

      value.clear();

      value.addAll(taggedProcessesList);

      final filteredProcesses = value.where((process) {
        final tagValue = _tag.toLowerCase();
        return process.progress.name.toLowerCase().contains(tagValue);
      }).toList();

      value.clear();

      value.addAll(filteredProcesses);

      _setLoadingValue(false);
    }
  }

  void _applyTagInProcessesList(String tag, bool taggedValue) {
    _setLoadingValue(true);

    _taggedValue = taggedValue;

    final taggedValues = value.where((process) {
      final tagValue = tag.toLowerCase();
      return process.progress.name.toLowerCase().contains(tagValue);
    }).toList();

    value.clear();

    value.addAll(taggedValues);

    _setLoadingValue(false);
  }

  void selectOveralTag() {
    _setLoadingValue(true);

    _taggedValue = false;

    value.clear();

    value.addAll(_processesPlaceholder);

    overalTagSelected.value = true;

    startedProcessTagSelected.value = false;

    finishedProcessSelected.value = false;

    _setLoadingValue(false);
  }

  void selectStartedProcessesTag() {
    value.clear();

    value.addAll(_processesPlaceholder);

    overalTagSelected.value = false;

    startedProcessTagSelected.value = true;

    finishedProcessSelected.value = false;

    _tag = Progress.started.name;

    _filter.isNotEmpty ? applyFilterInProcessesListWithTagValue(_filter) : _applyTagInProcessesList(_tag, true);
  }

  void selectFinishedProcessesTag() {
    value.clear();

    value.addAll(_processesPlaceholder);
    
    overalTagSelected.value = false;

    startedProcessTagSelected.value = false;

    finishedProcessSelected.value = true;

    _tag = Progress.finished.name;

    _filter.isNotEmpty ? applyFilterInProcessesListWithTagValue(_filter) : _applyTagInProcessesList(_tag, true);
  }

  void _setLoadingValue(bool value) {
    _loading = value;
    notifyListeners();
  }
}
