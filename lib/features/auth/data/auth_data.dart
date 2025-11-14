import 'package:dio/dio.dart';

class AuthData {
  static final Dio dio = Dio();
  static loginAuthData(String? email, dynamic password) async {
    try {
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

  static registerAuthData(
    String name,
    String email,
    String password,
    String nationalId,
    String phone,
    String gender,
    String? imageFile,
  ) async {
    try {
      final String api = "https://elwekala.onrender.com/user/register";
      var repo = await dio.post(
        api,
        data: {
          "name": name,
          "email": email,
          "password": password,
          "nationalId": nationalId,
          "phone": phone,
          "gender": gender,
          "profileImage": imageFile,
        },
      );
      print(repo.data);
      return repo.data;
    } catch (e) {
      print(e);
    }
  }
}
