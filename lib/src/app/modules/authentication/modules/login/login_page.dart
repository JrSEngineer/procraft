import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:procraft/src/app/modules/authentication/entities/login.dart';
import 'package:procraft/src/app/modules/authentication/modules/register/create_user_address_page.dart';
import 'package:procraft/src/app/modules/home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginFormKey = GlobalKey<FormState>();
  final login = ProcraftLogin(email: '', password: '');

  bool loading = false;

  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final pageHeightSpacer = height * 0.036;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            child: Column(
              children: [
                const Spacer(),
                SizedBox(
                  width: width * 0.72,
                  child: Image.asset('assets/images/procraft_logo.png'),
                ),
                const Spacer(),
                Form(
                  key: loginFormKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('E-mail'),
                          border: OutlineInputBorder(),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Por favor, informe seu e-mail.";
                          }
                          return null;
                        },
                        onChanged: (value) => login.email = value,
                      ),
                      SizedBox(height: pageHeightSpacer / 3),
                      TextFormField(
                        decoration: InputDecoration(
                          label: const Text('Senha'),
                          border: const OutlineInputBorder(),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() => hidePassword = !hidePassword);
                            },
                            child: Icon(hidePassword ? Icons.visibility_off : Icons.visibility),
                          ),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: hidePassword,
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Por favor, informe sua senha.";
                          }
                          return null;
                        },
                        onChanged: (value) => login.password = value,
                      ),
                      SizedBox(height: pageHeightSpacer / 3),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Esqueci minha senha",
                            style: Theme.of(context).primaryTextTheme.bodyMedium,
                          ),
                        ),
                      ),
                      SizedBox(height: pageHeightSpacer / 3),
                      Column(
                        children: [
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
                                await signIn(
                                  login.email,
                                  login.password,
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
                            child: loading
                                ? const CircularProgressIndicator()
                                : Text(
                                    "Entrar",
                                    style: Theme.of(context).primaryTextTheme.labelSmall?.copyWith(color: Theme.of(context).primaryColorLight),
                                  ),
                          ),
                          SizedBox(height: pageHeightSpacer / 2),
                          Text(
                            'Você também pode logar usando sua conta do Google.',
                            style: Theme.of(context).primaryTextTheme.bodySmall,
                          ),
                          SizedBox(height: pageHeightSpacer / 2),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).colorScheme.tertiary,
                                fixedSize: Size(MediaQuery.sizeOf(context).width, 54),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
                            onPressed: () {},
                            child: loading
                                ? const CircularProgressIndicator()
                                : Text(
                                    "Use sua conta Google",
                                    style: Theme.of(context).primaryTextTheme.labelSmall,
                                  ),
                          ),
                        ],
                      ),
                      SizedBox(height: pageHeightSpacer),
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
                          style: Theme.of(context).primaryTextTheme.labelMedium,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> signIn(String email, String password, Function onFailure, Function onSuccess) async {
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

_onSuccess(BuildContext context) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const HomePage(
        pageIndex: 0,
      ),
    ),
  );
}
