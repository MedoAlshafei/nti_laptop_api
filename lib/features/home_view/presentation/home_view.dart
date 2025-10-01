import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nti_laptop_api/features/home_view/data/model/product_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Product> products = [];
  bool isLoading = true;
  String? error;

  Future<void> getData() async {
    try {
      Dio dio = Dio();
      String api = "https://elwekala.onrender.com/product/Laptops";
      var response = await dio.get(api);
      var data = response.data;
      if (data is Map && data['product'] is List) {
        products = (data['product'] as List)
            .where((item) => item != null && item is Map<String, dynamic>)
            .map((item) => Product.fromJson(item as Map<String, dynamic>))
            .toList();
      } else {
        error = 'Unexpected API response structure';
      }
    } catch (e) {
      error = e.toString();
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: products.isEmpty ? getData() : null,
          builder: (context, asyncSnapshot) {
            return Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Card(
                    margin: EdgeInsets.all(10),
                    color: Colors.teal[100],
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      leading: Image.network(
                        product.image,
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                      title: Text(
                        product.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            product.price.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            product.company,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      trailing: Text(
                        product.category,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
