import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nti_laptop_api/features/home_view/data/model/product_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // @override
  // void initState() {
  //   super.initState();
  //   getAllProducts();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getAllProducts(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (asyncSnapshot.hasError) {
            return Center(child: Text(asyncSnapshot.error.toString()));
          }
          if (asyncSnapshot.data == null) {
            return Center(child: Text("No Data"));
          }
          print(productsList.length);
          return ListView.builder(
            itemCount: productsList.length,
            itemBuilder: (context, index) => Card(
              margin: EdgeInsets.all(10),
              elevation: 10,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.white,
              child: ListTile(
                title: Text(productsList[index].name),
                subtitle: Text(productsList[index].price.toString()),
                leading: Image.network(productsList[index].image),
                trailing: Text(productsList[index].description),
              ),
            ),
          );
        },
      ),
    );
  }
}

List<Product> productsList = [];

getAllProducts() async {
  Dio dio = Dio();
  String api = "https://elwekala.onrender.com/product/Laptops";
  final response = await dio.get(api);
  return response;
}
