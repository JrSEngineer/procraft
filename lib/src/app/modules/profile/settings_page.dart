import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:procraft/src/app/modules/authentication/modules/login/stores/login_store.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late LoginStore store;

  @override
  void initState() {
    super.initState();
    store = Modular.get<LoginStore>();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: store.loading,
      builder: (_, __) {
        return store.loading.value
            ? const CircularProgressIndicator()
            : Scaffold(
                appBar: AppBar(
                  actions: [
                    IconButton(
                      onPressed: store.signOut,
                      icon: const Text(
                        'Sair',
                      ),
                    )
                  ],
                ),
              );
      },
    );
  }
}
