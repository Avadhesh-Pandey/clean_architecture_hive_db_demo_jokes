import 'package:dio/dio.dart';

class ApiServices {
  final dio = Dio();

  Future<Response> getJokes() async {
    return await dio.get('https://geek-jokes.sameerkumar.website/api?format=json');
  }
}
