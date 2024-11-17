import 'package:flutter_modular/flutter_modular.dart';
import 'package:procraft/src/app/modules/splash/splash_page.dart';

class SplashModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const SplashPage());
  }
}
