import 'package:dio/dio.dart';

class CartData {
  final Dio dio = Dio();
  final String api = "https://elwekala.onrender.com/cart/allProducts";

  getCartData(String nid) async {
    var repo = await dio.post(api, data: {"nationalId": nid});
    print(repo.data["products"]);
    return repo.data["products"];
  }
}
