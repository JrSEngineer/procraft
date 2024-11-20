import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:procraft/src/app/modules/home/entities/procraft_user.dart';
import 'package:procraft/src/app/services/interfaces/istorage_service.dart';
import 'package:procraft/src/app/shared/common/globals.dart';

class AuthenticationInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final storageService = Modular.get<IStorageService<ProcraftUser>>();

    final user = await storageService.retrieveDataFromLocalStorage(USER_KEY);

    options.headers = {
      'authorization': 'Bearer ${user.authentication.token}',
    };

    super.onRequest(options, handler);
  }
}
