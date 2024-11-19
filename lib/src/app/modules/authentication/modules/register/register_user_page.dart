import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:procraft/src/app/modules/authentication/entities/new_address.dart';
import 'package:procraft/src/app/modules/authentication/modules/register/stores/register_store.dart';
import 'package:procraft/src/app/shared/utils/procraft_snackbar.dart';

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({super.key});

  @override
  State<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  late RegisterStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<RegisterStore>();
  }

  @override
  Widget build(BuildContext context) {
    NewAddress newAddress = Modular.args.data;

    store.user.value.address = newAddress;

    return Scaffold(
      body: Form(
        key: store.registerFormKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(label: Text('Nome Completo')),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Por favor, informe o seu nome completo.";
                  }
                  return null;
                },
                onChanged: (value) => store.user.value.fullName = value,
              ),
              TextFormField(
                decoration: const InputDecoration(label: Text('E-mail')),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Por favor, informe um e-mail para sua nova conta.";
                  }
                  return null;
                },
                onChanged: (value) => store.user.value.authentication.email = value,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(label: Text('Celular')),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Por favor, informe seu número de telefone.";
                  }
                  return null;
                },
                onChanged: (value) => store.user.value.phoneNumber = value,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(label: Text('CPF')),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Por favor, informe seu cpf.";
                  }
                  return null;
                },
                onChanged: (value) => store.user.value.cpf = value,
              ),
              TextFormField(
                decoration: const InputDecoration(label: Text('Senha')),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Por favor, informe uma senha com pelo menos 8 dígitos.";
                  }
                  if (value != null && value.length < 8) {
                    return "Por favor, informe uma senha com pelo menos 8 dígitos.";
                  }
                  return null;
                },
                onChanged: (value) => store.user.value.authentication.password = value,
              ),
              TextFormField(
                decoration: const InputDecoration(label: Text('Confirmar Senha')),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value != null && value.isEmpty) {
                    return "Por favor, informe uma senha com pelo menos 8 dígitos.";
                  }
                  if (value != null && value.length < 8) {
                    return "Por favor, informe uma senha com pelo menos 8 dígitos.";
                  }
                  return null;
                },
                onChanged: (value) => store.user.value.authentication.confirmationPassword = value,
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.sizeOf(context).width, 54),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
                onPressed: () async {
                  bool validUserPassword = store.user.value.authentication.password == store.user.value.authentication.confirmationPassword;

                  if (!validUserPassword) {
                    onFailure(context, "O valor das senhas não coincidem. Por favor, informe a mesma senha.");
                    return;
                  }

                  await store.register(
                    () => onFailure(
                      context,
                      'Erro realizar cadastro. verifique os dados e tente novamente.',
                    ),
                  );
                },
                child: store.loading.value ? const CircularProgressIndicator() : const Text("Cadastrar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> register(Map<String, dynamic> data, Function onFailure, Function onSuccess) async {
  try {
    final dio = Dio();

    final response = await dio.post('https://procraftapi.up.railway.app/api/authentication/register', data: data);

    if (response.statusCode != HttpStatus.created) {
      onFailure();
      return;
    }

    onSuccess();
  } catch (e) {
    onFailure();
  }
}
