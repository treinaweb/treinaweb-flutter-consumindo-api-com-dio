import 'package:cadastro/userMode.dart';

abstract class IUserRepository {
  Future<bool> postUser({required Map<String, Object?> data});

  Future<User> getFindUser({required String id});

  Future<List<User>> getAll();

  Future<bool> putUser(
      {required Map<String, Object?> data, required String id});

  Future<void> deleteUser({required String id});
}
