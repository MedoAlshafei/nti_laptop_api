import 'package:dio/dio.dart';
import 'package:nti_laptop_api/features/fav/data/fav_list_model.dart';

class FavData {
  final Dio dio = Dio();
  static const String api = "https://elwekala.onrender.com/favorite";
  final String nationalId = "01578557885808";

  getFavData() async {
    var repo = await dio.get(api, data: {"nationalId": nationalId});
    List data = repo.data["favoriteProducts"];
    List<FavListModel> listData = data
        .map((e) => FavListModel.fromJson(e))
        .toList();
    print(repo.data);
    print(listData[0]);
    return listData;
  }

  addFavData(String id) async {
    var repo = await dio.post(
      api,
      data: {"nationalId": nationalId, "productId": id},
    );
    print(repo.data);
    return repo.data["message"];
  }

  removeFavData(String id) async {
    var repo = await dio.delete(
      api,
      data: {"nationalId": nationalId, "productId": id},
    );
    print(repo.data);
    return repo.data["message"];
  }
}
