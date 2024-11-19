import 'package:flutter_modular/flutter_modular.dart';
import 'package:procraft/src/app/modules/authentication/guards/user_data_verifier_guard.dart';
import 'package:procraft/src/app/modules/splash/splash_page.dart';
import 'package:procraft/src/app/shared/common/common_module.dart';

class SplashModule extends Module {
  @override
  List<Module> get imports => [
        CommonModule(),
      ];
  @override
  void routes(RouteManager r) {
    r.child(
      '/',
      child: (_) => const SplashPage(),
      guards: [
        VerifiedUserGuard(),
      ],
    );
  }
}
