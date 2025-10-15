import 'package:dio/dio.dart';

class FavData {
  final Dio dio = Dio();

  addFavData(String id) async {
    final String api = "https://elwekala.onrender.com/favorite";
    var repo = await dio.post(
      api,
      data: {"nationalId": "01210567022258", "productId": id},
    );
    print(repo.data);
    return repo.data["message"];
  }
}
