import 'dart:convert';
import 'package:procraft/src/app/modules/home/entities/procraft_user.dart';
import 'package:procraft/src/app/services/interfaces/istorage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationStorageService implements IStorageService<ProcraftUser> {
  @override
  Future<ProcraftUser> saveInLocalStorage(ProcraftUser data) async {
    try {
      final preferences = await SharedPreferences.getInstance();

      final userJson = json.encode(data.toMap());

      bool savedSuccessfullyInLocalStorage = await preferences.setString(data.id, userJson);

      if (!savedSuccessfullyInLocalStorage) {
        throw Exception('Erro ao salvar dados localmente. Tipo de storage $runtimeType');
      }
      return data;
    } catch (e) {
      throw Exception('Erro ao salvar dados localmente. Tipo de storage $runtimeType');
    }
  }

  @override
  Future<ProcraftUser> retrieveDataFromLocalStorage(String storageId) async {
    try {
      final preferences = await SharedPreferences.getInstance();

      final userJson = preferences.getString(storageId);

      if (userJson == null) {
        throw Exception('Erro ao recuperar dados locais.');
      }

      final userMap = json.decode(userJson) as Map<String, dynamic>;

      return ProcraftUser.fromMap(userMap);
    } catch (e) {
      throw Exception('Erro ao recuperar dados locais.');
    }
  }

  @override
  Future<void> removeFromLocalStorage(String storageId) async {
    try {
      final preferences = await SharedPreferences.getInstance();

      final userJson = preferences.getString(storageId);

      if (userJson == null) {
        throw Exception('Erro ao deletar dados locais.');
      }
      await preferences.remove(storageId);
    } catch (e) {
      throw Exception('Erro ao deletar dados locais.');
    }
  }
}
