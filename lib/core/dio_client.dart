import 'package:dio/dio.dart';

class ApiClient {
  Future getArticles(String path) async {
    try {
      final response =
          await Dio().get(path);
      return response.data;
    } on DioError catch (e) {
      throw Exception(e.message);
    }
  }
}