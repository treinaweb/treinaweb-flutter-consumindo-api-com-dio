import 'dart:convert';

import 'package:cadastro/data/api.dart';
import 'package:cadastro/userMode.dart';
import 'package:flutter/material.dart';

class CadastroController {
  final ApiService _apiService = ApiService();
  final nameController = TextEditingController();
  final idadeController = TextEditingController();

  Future<void> addUser({required BuildContext context}) async {
    final response = await _apiService.dio.post(
      "/user",
      data: {"name": nameController.text, "idade": idadeController.text},
    );

    if (response.statusCode == 200) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        "/home",
        (route) => false,
      );
    }
  }

  Future<void> editUser(
      {required BuildContext context, required String userId}) async {
    final response = await _apiService.dio.put(
      "/user",
      data: {"name": nameController.text, "idade": idadeController.text},
      queryParameters: {"id": userId},
    );

    if (response.statusCode == 200) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        "/home",
        (route) => false,
      );
    }
  }

  Future<User> getUser(String? userId) async {
    if (userId != null) {
      final response =
          await _apiService.dio.get("/user", queryParameters: {"id": userId});
      final data = jsonDecode(response.data);
      final user = User.fromJson(data);
      nameController.text = user.nome;
      idadeController.text = user.idade.toString();
      return user;
    } else {
      return User(nome: '', idade: 0);
    }
  }
}
