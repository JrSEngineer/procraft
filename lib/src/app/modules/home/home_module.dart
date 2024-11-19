import 'package:flutter_modular/flutter_modular.dart';
import 'package:procraft/src/app/modules/home/home_page.dart';

class HomeModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const HomePage(pageIndex: 0), transition: TransitionType.fadeIn);
  }
}
