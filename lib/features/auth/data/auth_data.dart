import 'package:dio/dio.dart';

class AuthData {
  static loginAuth(String email, dynamic password) async {
    try {
      final Dio dio = Dio();
      final String api = "https://elwekala.onrender.com/user/login";
      var repo = await dio.post(
        api,
        data: {"email": email, "password": password},
      );
      print(repo.data);
      return repo.data;
    } catch (e) {
      print(e);
    }
  }
}
