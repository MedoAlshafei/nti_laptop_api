import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_laptop_api/features/cart_item/cubit/cart_cubit.dart';
import 'package:nti_laptop_api/features/fav/cubit/fav_cubit.dart';
import 'package:nti_laptop_api/features/home_view/data/product_model.dart';

class DetalisView extends StatelessWidget {
  const DetalisView({super.key, required this.productData});

  final ProductModel productData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Laptops Details",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.lightBlue[500],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 300,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productData.images.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Image.network(
                          productData.images[index],
                          height: 300,
                          fit: BoxFit.fitWidth,
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    productData.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<FavCubit>(
                        context,
                      ).addFavCubit(productData.id);
                    },

                    icon: Icon(Icons.favorite, color: Colors.red),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.grey[200],
                ),
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 8,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description: ',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          productData.description,
                          style: const TextStyle(fontSize: 16),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    _detailsBuilder('Price:', productData.price.toString()),
                    _detailsBuilder('Category:', productData.category),
                    _detailsBuilder('Company:', productData.company),
                    _detailsBuilder('Sales:', productData.sales.toString()),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<CartCubit>(
                              context,
                            ).addCartCubit(productData.id);
                          },
                          clipBehavior: Clip.antiAlias,
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(175, 60),
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            backgroundColor: Colors.green[700],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 4,
                            children: [
                              Icon(
                                Icons.add_shopping_cart,
                                color: Colors.white,
                              ),
                              Text(
                                "Add to cart",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     BlocProvider.of<FavCubit>(
                    //       context,
                    //     ).removeFavCubit(productData.id);
                    //   },
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: [
                    //       Icon(Icons.remove, color: Colors.red),
                    //       Text(
                    //         "remove to favorite",
                    //         style: TextStyle(
                    //           fontSize: 18,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row _detailsBuilder(String text, String value) {
    return Row(
      children: [
        Text(text, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(width: 10),
        Text(
          value,
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
