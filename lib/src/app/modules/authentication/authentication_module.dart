import 'package:flutter_modular/flutter_modular.dart';
import 'package:procraft/src/app/modules/authentication/modules/login/login_module.dart';
import 'package:procraft/src/app/modules/authentication/modules/register/register_module.dart';
import 'package:procraft/src/app/shared/common/common_module.dart';

class AuthenticationModule extends Module {
  @override
  List<Module> get imports => [
        CommonModule(),
      ];

  @override
  void routes(RouteManager r) {
    r.module('/', module: LoginModule(), transition: TransitionType.fadeIn);
    r.module('/register', module: RegisterModule(), transition: TransitionType.fadeIn);
  }
}
