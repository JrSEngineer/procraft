// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:procraft/src/app/backend/globals.dart';
import 'package:procraft/src/app/modules/home/entities/procraft_user.dart';
import 'package:procraft/src/app/services/interfaces/istorage_service.dart';

class VerifiedUserGuard extends RouteGuard {
  VerifiedUserGuard() : super(redirectTo: '/authentication/');

  @override
  FutureOr<bool> canActivate(String path, ParallelRoute route) async {
    try {
      final dio = Modular.get<Dio>();

      final storageService = Modular.get<IStorageService<ProcraftUser>>();

      if (USER_KEY.isEmpty) {
        return false;
      }

      final user = await storageService.retrieveDataFromLocalStorage(USER_KEY);

      final response = await dio.post('/authentication/token', data: {
        'token': user.authentication.token,
      });

      if (response.statusCode != HttpStatus.ok) {
        return false;
      }

      Modular.setArguments(user);

      return true;
    } catch (e) {
      return false;
    }
  }
}
