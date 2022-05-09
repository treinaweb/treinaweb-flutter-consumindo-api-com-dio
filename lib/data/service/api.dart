import 'package:dio/dio.dart';

class Rest {
  final _baseUrl = "http://10.0.2.2:3002/api";
  final dio = Dio();

  Rest() {
    dio.options.baseUrl = _baseUrl;
    dio.options.connectTimeout = 5000;
    dio.options.contentType = "application/json";
    dio.options.headers = {
      "Accept-language": "ptBR",
      "Accept": "application/json"
    };
  }
}
