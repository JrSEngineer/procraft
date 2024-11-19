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

  void changePasswordVisibilityStatus() => hidePassword.value = !hidePassword.value;

  void _setLoadingStatus(bool status) => loading.value = status;

  onFailure(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).colorScheme.error,
        content: Center(
          child: Text(
            message,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).primaryColorLight),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
