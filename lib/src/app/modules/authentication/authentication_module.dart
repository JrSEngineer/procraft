import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:procraft/src/app/backend/api.dart';
import 'package:procraft/src/app/modules/authentication/data/authentication_repository.dart';
import 'package:procraft/src/app/modules/authentication/interfaces/iauthentication_repository.dart';
import 'package:procraft/src/app/modules/authentication/modules/login/login_module.dart';
import 'package:procraft/src/app/modules/authentication/modules/register/register_module.dart';
import 'package:procraft/src/app/modules/authentication/services/authentication_storage_service.dart';
import 'package:procraft/src/app/modules/home/entities/procraft_user.dart';
import 'package:procraft/src/app/services/interfaces/istorage_service.dart';

class AuthenticationModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addInstance(Dio(BaseOptions(baseUrl: '$API_URL/')));
    i.add<IStorageService<ProcraftUser>>(AuthenticationStorageService.new);
    i.add<IAuthenticationRepository>(AuthenticationRepository.new);
  }

  @override
  void routes(RouteManager r) {
    r.module('/', module: LoginModule());
    r.module('/register', module: RegisterModule());
  }
}
