import 'package:flutter_modular/flutter_modular.dart';
import 'package:procraft/src/app/modules/authentication/modules/login/login_page.dart';
import 'package:procraft/src/app/modules/authentication/modules/login/stores/login_store.dart';
import 'package:procraft/src/app/shared/common/common_module.dart';

class LoginModule extends Module {
  @override
  List<Module> get imports => [
        CommonModule(),
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
