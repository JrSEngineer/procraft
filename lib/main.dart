import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:procraft/src/procraft_modules.dart';
import 'package:procraft/src/procraft_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(
    ModularApp(
      module: ProcraftModule(),
      child: const ProcraftWidget(),
    ),
  );
}
