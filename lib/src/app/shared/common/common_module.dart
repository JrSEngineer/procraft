import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:procraft/src/app/modules/authentication/data/authentication_repository.dart';
import 'package:procraft/src/app/modules/authentication/interfaces/iauthentication_repository.dart';
import 'package:procraft/src/app/modules/authentication/services/authentication_storage_service.dart';
import 'package:procraft/src/app/modules/home/entities/procraft_user.dart';
import 'package:procraft/src/app/services/interfaces/istorage_service.dart';
import 'package:procraft/src/app/shared/http/client/procraft_dio_client.dart';

class CommonModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addInstance<Dio>(ProcraftDioClient());
    i.add<IStorageService<ProcraftUser>>(AuthenticationStorageService.new);
    i.add<IAuthenticationRepository>(AuthenticationRepository.new);
  }
}
