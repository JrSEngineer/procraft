import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:procraft/src/app/modules/authentication/modules/login/stores/login_store.dart';
import 'package:procraft/src/app/shared/utils/procraft_snackbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginFormKey = GlobalKey<FormState>();
  late LoginStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<LoginStore>();
  }

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
                        onChanged: (value) => store.login.value.email = value,
                      ),
                      SizedBox(height: pageHeightSpacer / 3),
                      AnimatedBuilder(
                          animation: store.hidePassword,
                          builder: (_, __) {
                            return TextFormField(
                              decoration: InputDecoration(
                                label: const Text('Senha'),
                                border: const OutlineInputBorder(),
                                suffixIcon: GestureDetector(
                                  onTap: store.changePasswordVisibilityStatus,
                                  child: Icon(store.hidePassword.value ? Icons.visibility_off : Icons.visibility),
                                ),
                              ),
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              obscureText: store.hidePassword.value,
                              validator: (value) {
                                if (value != null && value.isEmpty) {
                                  return "Por favor, informe sua senha.";
                                }
                                return null;
                              },
                              onChanged: (value) => store.login.value.password = value,
                            );
                          }),
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
                          AnimatedBuilder(
                              animation: store.loading,
                              builder: (_, __) {
                                return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      fixedSize: Size(MediaQuery.sizeOf(context).width, 54),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
                                  onPressed: () async => await store.signIn(
                                    () {
                                      onFailure(context, 'Login não realizado. Verifique seus dados e sua conexão.');
                                    },
                                  ),
                                  child: store.loading.value
                                      ? const CircularProgressIndicator()
                                      : Text(
                                          "Entrar",
                                          style: Theme.of(context).primaryTextTheme.labelSmall?.copyWith(color: Theme.of(context).primaryColorLight),
                                        ),
                                );
                              }),
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
                            child: Text(
                              "Use sua conta Google",
                              style: Theme.of(context).primaryTextTheme.labelSmall,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: pageHeightSpacer),
                      TextButton(
                        onPressed: () => Modular.to.pushNamed('./register/'),
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
