import 'package:cadastro/service.dart';
import 'package:cadastro/userMode.dart';

class CadastroController {
  final UserService _userService = UserService();
  List<User> addUser({required String nome, required String idade}) {
    return _userService.addUser(name: nome, idade: idade);
  }
}
