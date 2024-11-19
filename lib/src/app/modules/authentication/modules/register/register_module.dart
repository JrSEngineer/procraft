import 'package:flutter_modular/flutter_modular.dart';
import 'package:procraft/src/app/modules/authentication/modules/register/create_user_address_page.dart';
import 'package:procraft/src/app/modules/authentication/modules/register/register_user_page.dart';
import 'package:procraft/src/app/modules/authentication/modules/register/stores/register_store.dart';
import 'package:procraft/src/app/shared/common/common_module.dart';

class RegisterModule extends Module {
  @override
  List<Module> get imports => [
        CommonModule(),
      ];

  @override
  void binds(Injector i) {
    i.add(RegisterStore.new);
  }

  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const CreateUserAddressPage());
    r.child('/user', child: (_) => const RegisterUserPage());
  }
}
