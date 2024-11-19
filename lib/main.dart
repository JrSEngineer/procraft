import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:procraft/src/app/shared/utils/load_user_key.dart';
import 'package:procraft/src/procraft_module.dart';
import 'package:procraft/src/procraft_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await loadUserKey();

  runApp(
    ModularApp(
      module: ProcraftModule(),
      child: const ProcraftWidget(),
    ),
  );
}
