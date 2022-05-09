import 'dart:convert';

import 'package:cadastro/data/repository/repository_interface.dart';
import 'package:cadastro/data/service/api.dart';
import 'package:cadastro/userMode.dart';

class UserRepository implements IUserRepository {
  final _dio = Rest().dio;

  @override
  Future<void> deleteUser({required String id}) async {
    await _dio.delete("/user", queryParameters: {"id": id});
  }

  @override
  Future<List<User>> getAll() async {
    final response = await _dio.get("/user");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.data) as List;

      final listUser = data.map((json) => User.fromJson(json)).toList();

      return listUser;
    } else {
      return [];
    }
  }

  @override
  Future<User> getFindUser({required String id}) async {
    final response = await _dio.get("/user", queryParameters: {"id": id});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.data);
      final user = User.fromJson(data);

      return user;
    }

    return User(nome: "", idade: 0);
  }

  @override
  Future<bool> postUser({required Map<String, Object?> data}) async {
    final repsonse = await _dio.post("/user", data: data);

    if (repsonse.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> putUser(
      {required Map<String, Object?> data, required String id}) async {
    final response =
        await _dio.put("/user", data: data, queryParameters: {"id": id});

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
