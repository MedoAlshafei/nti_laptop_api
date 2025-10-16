import 'package:dio/dio.dart';
import 'package:nti_laptop_api/features/fav/data/fav_list_model.dart';

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

  Future getFavData() async {
    var repo = await dio.get(api, data: {"nationalId": "01578557885808"});
    List data = repo.data["favoriteProducts"];
    List<FavListModel> listData = data
        .map((e) => FavListModel.fromJson(e))
        .toList();
    print(listData[0].name);
    return listData;
  }
}
