import 'package:dio/dio.dart';
import 'package:nti_laptop_api/features/cart_item/data/cart_model.dart';

class CartData {
  final Dio dio = Dio();
  final String api = "https://elwekala.onrender.com/cart/allProducts";
  final String nid = "01578557885808";
  // final String productId = "6466704691c71d884185b785";
  // final int quantity = -2;

  getCartData() async {
    var repo = await dio.get(api, data: {"nationalId": nid});
    List data = repo.data["products"];
    List<CardModel> listData = data.map((e) => CardModel.fromJson(e)).toList();
    print(listData);
    return listData;
  }

  addCartData(String id) async {
    var repo = await dio.post(
      "https://elwekala.onrender.com/cart/add",
      data: {"nationalId": nid, "productId": id, "quantity": 1},
    );
    print(repo.data);
    return repo;
  }

  updateCartData(String id, num quantity) async {
    var repo = await dio.put(
      "https://elwekala.onrender.com/cart",
      data: {"nationalId": nid, "productId": id, "quantity": quantity},
    );
    print(repo.data);
    return repo;
  }

  deleteCartData(String id) async {
    var repo = await dio.delete(
      "https://elwekala.onrender.com/cart/delete",
      data: {"nationalId": nid, "productId": id},
    );
    print(repo.data);
    return repo;
  }
}
