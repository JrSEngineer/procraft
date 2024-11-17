import 'package:flutter_modular/flutter_modular.dart';
import 'package:procraft/src/app/modules/authentication/authentication_module.dart';
import 'package:procraft/src/app/modules/documentation/documentation_module.dart';
import 'package:procraft/src/app/modules/home/home_module.dart';
import 'package:procraft/src/app/modules/profile/profile_module.dart';
import 'package:procraft/src/app/modules/projects/projects_module.dart';
import 'package:procraft/src/app/modules/splash/splash_module.dart';

class ProcraftModule extends Module {
  @override
  void routes(RouteManager r) {
    r.module('/', module: SplashModule());
    r.module('/authentication', module: AuthenticationModule());
    r.module('/home', module: HomeModule());
    r.module('/projects', module: ProjectsModule());
    r.module('/documentation', module: DocumentationModule());
    r.module('/profile', module: ProfileModule());
  }
}
