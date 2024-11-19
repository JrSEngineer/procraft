import 'package:flutter_modular/flutter_modular.dart';
import 'package:procraft/src/app/modules/authentication/modules/login/login_module.dart';
import 'package:procraft/src/app/modules/authentication/modules/login/stores/login_store.dart';
import 'package:procraft/src/app/modules/profile/profile_page.dart';
import 'package:procraft/src/app/modules/profile/settings_page.dart';
import 'package:procraft/src/app/shared/common/common_module.dart';

class ProfileModule extends Module {
  @override
  List<Module> get imports => [
        CommonModule(),
        LoginModule(),
      ];

  @override
  void binds(Injector i) {
    i.add(LoginStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const ProfilePage(), transition: TransitionType.fadeIn);
    r.child('/settings', child: (_) => const SettingsPage(), transition: TransitionType.fadeIn);
  }
}
