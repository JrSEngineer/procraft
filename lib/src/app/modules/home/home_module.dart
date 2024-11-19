import 'package:flutter_modular/flutter_modular.dart';
import 'package:procraft/src/app/modules/authentication/guards/user_data_verifier_guard.dart';
import 'package:procraft/src/app/modules/home/home_page.dart';

class HomeModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/',
        child: (_) => const HomePage(pageIndex: 0),
        guards: [
          VerifiedUserGuard(),
        ],
        transition: TransitionType.fadeIn);
  }
}
