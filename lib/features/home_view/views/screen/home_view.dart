import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_laptop_api/features/cart_item/views/screen/cart_view.dart';
import 'package:nti_laptop_api/features/fav/views/favoite_list_view.dart';
import 'package:nti_laptop_api/features/home_view/cubit/product_cubit.dart';
import 'package:nti_laptop_api/features/home_view/views/screen/detalis_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ProductLoadedState) {
          return Scaffold(
            backgroundColor: Colors.grey[350],
            appBar: AppBar(
              scrolledUnderElevation: 0,
              elevation: 0,
              title: const Text(
                "Laptops store",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.lightBlue[500],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            body: ListView.builder(
              itemCount: state.listProduct.length,
              itemBuilder: (context, index) {
                return _bodyBuilderCard(state, index, context);
              },
            ),
            bottomNavigationBar: Container(
              height: 85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 6,
                    offset: Offset(0, 1),
                  ),
                ],
                color: Colors.lightBlue[50],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartView()),
                      );
                    },
                    icon: Icon(Icons.shopping_cart),
                    color: Colors.grey[700],
                    iconSize: 32,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FavoiteListView(),
                        ),
                      );
                    },
                    icon: Icon(Icons.favorite),
                    color: Colors.red[500],
                    iconSize: 32,
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  Card _bodyBuilderCard(ProductLoadedState state, int index, context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 5,
      color: Colors.grey[100],
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DetalisView(productData: state.listProduct[index]),
            ),
          );
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.network(
                    state.listProduct[index].image,
                    fit: BoxFit.fitWidth,
                    // width: double.infinity,
                    height: 200,
                  ),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      state.listProduct[index].name,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    state.listProduct[index].description,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Price:",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Card(
                            color: Colors.grey[300],
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                state.listProduct[index].price.toString(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            state.listProduct[index].status,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: state.listProduct[index].status == "New"
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
