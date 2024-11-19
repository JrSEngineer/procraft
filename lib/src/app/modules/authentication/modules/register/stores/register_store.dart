import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:procraft/src/app/modules/authentication/entities/new_address.dart';
import 'package:procraft/src/app/modules/authentication/entities/new_authentication.dart';
import 'package:procraft/src/app/modules/authentication/entities/new_user.dart';
import 'package:procraft/src/app/modules/authentication/interfaces/iauthentication_repository.dart';

class RegisterStore {
  RegisterStore(this._repository);

  final IAuthenticationRepository _repository;

  final registerFormKey = GlobalKey<FormState>();

  ValueNotifier<bool> loading = ValueNotifier(false);
  ValueNotifier<NewUser> user = ValueNotifier(NewUser(
    fullName: '',
    profileImage: 'https://picsum.photos/200',
    description: 'Usuário Procraft',
    phoneNumber: '',
    cpf: '',
    authentication: NewAuthentication(
      email: '',
      password: '',
    ),
    address: NewAddress(
      addressNumber: '',
      street: '',
      city: '',
      state: '',
      zipCode: '',
      country: '',
    ),
  ));

  Future<void> register(Function() onFailure) async {
    try {
      if (registerFormKey.currentState!.validate()) {
        final createdUser = await _repository.register(user.value);

        if (createdUser == null) {
          onFailure();
        }

        Modular.to.navigate('/home/', arguments: createdUser);
      }
    } catch (e) {
      onFailure();
    }
  }
}
