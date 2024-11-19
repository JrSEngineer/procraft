// ignore_for_file: unused_element

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:procraft/src/app/modules/authentication/entities/procraft_login.dart';
import 'package:procraft/src/app/modules/authentication/interfaces/iauthentication_repository.dart';

class LoginStore {
  LoginStore(this._repository);

  final IAuthenticationRepository _repository;

  ValueNotifier<bool> loading = ValueNotifier(false);
  ValueNotifier<bool> hidePassword = ValueNotifier(true);

  ValueNotifier<ProcraftLogin> login = ValueNotifier(ProcraftLogin(email: '', password: ''));

  Future<void> signIn(Function onFailure) async {
    try {
      _setLoadingStatus(true);

      final user = await _repository.signIn(login.value);

      if (user == null) {
        onFailure();
        _setLoadingStatus(false);
      }

      _setLoadingStatus(false);

      Modular.to.navigate('/home', arguments: user);
    } catch (e) {
      _setLoadingStatus(false);
      onFailure();
    }
  }

  Future<void> signOut() async {
    try {
      _setLoadingStatus(true);

      await _repository.signOut();

      Modular.to.navigate('/authentication/');
      
      _setLoadingStatus(false);
    } catch (e) {
      _setLoadingStatus(false);
    }
  }

  void changePasswordVisibilityStatus() => hidePassword.value = !hidePassword.value;

  void _setLoadingStatus(bool status) => loading.value = status;
}
