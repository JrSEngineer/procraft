// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:procraft/src/app/modules/authentication/entities/new_user.dart';
import 'package:procraft/src/app/modules/authentication/entities/procraft_login.dart';
import 'package:procraft/src/app/modules/authentication/interfaces/iauthentication_repository.dart';
import 'package:procraft/src/app/modules/home/entities/procraft_user.dart';
import 'package:procraft/src/app/services/interfaces/istorage_service.dart';

class AuthenticationRepository implements IAuthenticationRepository {
  AuthenticationRepository(this._dio, this._storageService);

  final Dio _dio;
  final IStorageService<ProcraftUser> _storageService;

  @override
  Future<ProcraftUser?> register(NewUser newUser) async {
    try {
      final response = await _dio.post(
        'authentication/register',
        data: newUser.toMap(),
      );

      if (response.statusCode != HttpStatus.created) {
        return null;
      }

      final body = response.data as Map<String, dynamic>;

      final user = await _storageService.saveInLocalStorage(ProcraftUser.fromMap(body));

      return user;
    } catch (e) {
      throw Exception('Erro ao cadastrar usuário.');
    }
  }

  @override
  Future<ProcraftUser?> signIn(ProcraftLogin login) async {
    try {
      final response = await _dio.post(
        'authentication',
        data: login.toMap(),
      );

      if (response.statusCode != HttpStatus.ok) {
        return null;
      }

      final body = response.data as Map<String, dynamic>;

      final user = await _storageService.saveInLocalStorage(ProcraftUser.fromMap(body));

      return user;
    } catch (e) {
      throw Exception('Erro ao realizar login.');
    }
  }
}
