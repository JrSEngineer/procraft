import 'package:flutter_modular/flutter_modular.dart';
import 'package:procraft/src/app/modules/profile/profile_page.dart';

class ProfileModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const ProfilePage(pageIndex: 3));
  }
}
