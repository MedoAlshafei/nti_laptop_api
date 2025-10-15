import 'package:dio/dio.dart';
import 'package:nti_laptop_api/features/home_view/data/product_model.dart';

class FavoriteListData {
  final Dio dio = Dio();
  static const String _api = "https://elwekala.onrender.com/favorite";

  Future<List<ProductModel>> getFavoriteList() async {
    var repo = await dio.get(
      _api,
      queryParameters: {"nationalId": "01578557885808"},
    );
    List favData = repo.data["favorites"];
    List<ProductModel> favoritesList = favData
        .map((json) => ProductModel.fromJson(json))
        .toList();

    print(favoritesList);
    return favoritesList;
  }
}
