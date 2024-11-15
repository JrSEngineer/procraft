import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:procraft/src/app/modules/authentication/create_user_address_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginFormKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Form(
            key: loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(label: Text('E-mail')),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Por favor, informe seu e-mail.";
                    }
                    return null;
                  },
                  onChanged: (value) => email = value,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  decoration: const InputDecoration(label: Text('Senha')),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: true,
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Por favor, informe sua senha.";
                    }
                    return null;
                  },
                  onChanged: (value) => password = value,
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
                    if (loginFormKey.currentState!.validate()) {
                      await login(
                        email,
                        password,
                        () => _onFailure(context, "Login não realizado. Verifique seus dados e sua conexão."),
                        () => _onSuccess(context),
                      );
                      setState(() {
                        loading = false;
                      });

                      return;
                    }
                    setState(() {
                      loading = false;
                    });
                  },
                  child: loading ? const CircularProgressIndicator() : const Text("Entrar"),
                ),
                const SizedBox(height: 36),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CreateUserAddressPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Criar conta",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> login(String email, String password, Function onFailure, Function onSuccess) async {
  try {
    final dio = Dio();

    final response = await dio.post(
      'https://procraftapi.up.railway.app/api/authentication',
      data: {
        "email": email,
        "password": password,
      },
    );

    if (response.statusCode != HttpStatus.ok) {
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
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    ),
  );
}

_onSuccess(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const Scaffold(
        body: Center(
          child: Text('Home Page'),
        ),
      ),
    ),
  );
}
