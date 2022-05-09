import 'dart:convert';

import 'package:cadastro/data/repository/repository.dart';
import 'package:cadastro/data/repository/repository_interface.dart';
import 'package:cadastro/data/service/api.dart';
import 'package:cadastro/userMode.dart';
import 'package:flutter/material.dart';

class CadastroController {
  final IUserRepository _userRepository = UserRepository();
  final nameController = TextEditingController();
  final idadeController = TextEditingController();

  Future<void> addUser({required BuildContext context}) async {
    final response = await _userRepository.postUser(
      data: {"name": nameController.text, "idade": idadeController.text},
    );

    if (response) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        "/home",
        (route) => false,
      );
    }
  }

  Future<void> editUser(
      {required BuildContext context, required String userId}) async {
    final response = await _userRepository.putUser(
      data: {"name": nameController.text, "idade": idadeController.text},
      id: userId,
    );

    if (response) {
      Navigator.of(context).pushNamedAndRemoveUntil(
        "/home",
        (route) => false,
      );
    }
  }

  Future<User> getUser(String? userId) async {
    if (userId != null) {
      final user = await _userRepository.getFindUser(
        id: userId,
      );

      nameController.text = user.nome;
      idadeController.text = user.idade.toString();

      return user;
    } else {
      return User(nome: '', idade: 0);
    }
  }
}
