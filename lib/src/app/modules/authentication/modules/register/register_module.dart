import 'package:flutter_modular/flutter_modular.dart';
import 'package:procraft/src/app/modules/authentication/modules/register/create_user_address_page.dart';
import 'package:procraft/src/app/modules/authentication/modules/register/register_user_page.dart';

class RegisterModule extends Module {
  @override
  void routes(RouteManager r) {
    r.child('/', child: (_) => const CreateUserAddressPage());
    r.child('/user', child: (_) => RegisterUserPage(address: r.args.data));
  }
}
