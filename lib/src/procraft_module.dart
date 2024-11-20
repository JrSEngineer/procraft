import 'package:flutter_modular/flutter_modular.dart';
import 'package:procraft/src/app/modules/authentication/authentication_module.dart';
import 'package:procraft/src/app/modules/documentation/documentation_module.dart';
import 'package:procraft/src/app/modules/home/home_module.dart';
import 'package:procraft/src/app/modules/profile/profile_module.dart';
import 'package:procraft/src/app/modules/processes/processes_module.dart';
import 'package:procraft/src/app/modules/splash/splash_module.dart';

class ProcraftModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module('/', module: SplashModule());
    r.module('/authentication', module: AuthenticationModule(), duration: const Duration(milliseconds: 100));
    r.module('/home', module: HomeModule(), duration: const Duration(milliseconds: 100));
    r.module('/processes', module: ProcessesModule(), duration: const Duration(milliseconds: 100));
    r.module('/documentation', module: DocumentationModule(), duration: const Duration(milliseconds: 100));
    r.module('/profile', module: ProfileModule(), duration: const Duration(milliseconds: 100));
  }
}
