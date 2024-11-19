import 'package:flutter_modular/flutter_modular.dart';
import 'package:procraft/src/app/modules/authentication/authentication_module.dart';
import 'package:procraft/src/app/modules/authentication/modules/login/login_page.dart';
import 'package:procraft/src/app/modules/authentication/modules/login/stores/login_store.dart';

class LoginModule extends Module {
  @override
  
  List<Module> get imports => [
        AuthenticationModule(),
      ];
  @override
  void binds(Injector i) {
    i.add(LoginStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const LoginPage());
  }
}
