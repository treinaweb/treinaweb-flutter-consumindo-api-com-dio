import 'dart:convert';

import 'package:cadastro/data/api.dart';
import 'package:cadastro/userMode.dart';

class HomeController {
  final ApiService _apiService = ApiService();

  Future<List<User>?> getAllUser() async {
    final response = await _apiService.dio.get("/user");

    if (response.statusCode == 200) {
      final data = jsonDecode(response.data) as List;
      return data.map((json) => User.fromJson(json)).toList();
    } else {
      return null;
    }
  }
}
