import 'package:dio/dio.dart';
import 'package:nti_laptop_api/features/home_view/model/product_model.dart';

class ProductData {
  final Dio dio = Dio();

  Future<List<ProductModel>> getProducts() async {
    final String api = "https://elwekala.onrender.com/product/Laptops";

    var repo = await dio.get(api);
    List data = repo.data["product"];
    List<ProductModel> listData = data
        .map((e) => ProductModel.fromJson(e))
        .toList();

    return listData;
  }
}
