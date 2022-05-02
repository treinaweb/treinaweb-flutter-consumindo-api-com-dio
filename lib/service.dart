import 'package:cadastro/userMode.dart';

class UserService {
  final _listUsers = <User>[];

  UserService._internal();
  static final _singleton = UserService._internal();

  factory UserService() => _singleton;

  List<User> addUser({required String name, required String idade}) {
    _listUsers.add(User(nome: name, idade: int.parse(idade)));
    return _listUsers;
  }
}
