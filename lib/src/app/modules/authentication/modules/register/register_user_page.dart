import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterUserPage extends StatefulWidget {
  const RegisterUserPage({required this.address, super.key});

  final Map<String, dynamic> address;

  @override
  State<RegisterUserPage> createState() => _RegisterUserPageState();
}

class _RegisterUserPageState extends State<RegisterUserPage> {
  final registerFormKey = GlobalKey<FormState>();

  String fullName = "";
  String newEmail = "";
  String phoneNumber = "";
  String cpf = "";
  String newPassword = "";
  String confirmationPassword = "";

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: registerFormKey,
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
                onChanged: (value) => fullName = value,
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
                onChanged: (value) => newEmail = value,
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
                onChanged: (value) => phoneNumber = value,
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
                onChanged: (value) => cpf = value,
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
                onChanged: (value) => newPassword = value,
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
                onChanged: (value) => confirmationPassword = value,
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
                  setState(() {
                    loading = true;
                  });

                  if (registerFormKey.currentState!.validate()) {
                    if (newPassword != confirmationPassword) {
                      _onFailure(context, "O valor das senhas não coincidem. Por favor, informe a mesma senha.");

                      setState(() {
                        loading = false;
                      });
                      return;
                    }
                    final data = {
                      "fullName": fullName,
                      "profileImage": "https://picsum.photos/450",
                      "description": "Usuário do app Procraft.",
                      "phoneNumber": phoneNumber,
                      "cpf": cpf,
                      "authentication": {
                        "email": newEmail,
                        "password": newPassword,
                        "role": 0,
                        "accountStatus": 0,
                      },
                      "address": {
                        "street": widget.address["street"],
                        "city": widget.address["city"],
                        "state": widget.address["state"],
                        "zipCode": widget.address["zipCode"],
                        "country": widget.address["country"],
                      }
                    };

                    await register(
                      data,
                      () => _onFailure(
                        context,
                        "Erro realizar cadastro. verifique os dados e tente novamente.",
                      ),
                      () => _onSuccess(context),
                    );

                    setState(() {
                      loading = false;
                    });
                  }
                  setState(() {
                    loading = false;
                  });
                },
                child: loading ? const CircularProgressIndicator() : const Text("Cadastrar"),
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

_onFailure(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Theme.of(context).primaryColor,
      content: Center(
        child: Text(
          message,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      ),
    ),
  );
}

_onSuccess(BuildContext context) {
  Modular.to.navigate('/home');
}
