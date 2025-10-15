import 'package:dio/dio.dart';

class FavData {
  final Dio dio = Dio();
  static const String api = "https://elwekala.onrender.com/favorite";

  Future addFavData(String id) async {
    var repo = await dio.post(
      api,
      data: {"nationalId": "01578557885808", "productId": id},
    );
    print(repo.data);
    return repo.data["message"];
  }

  Future removeFavData(String id) async {
    var repo = await dio.delete(
      api,
      data: {"nationalId": "01578557885808", "productId": id},
    );
    print(repo.data);
    return repo.data["message"];
  }
}
