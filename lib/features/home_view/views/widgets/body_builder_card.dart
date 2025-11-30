import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_laptop_api/features/fav/cubit/fav_cubit.dart';
import 'package:nti_laptop_api/features/home_view/cubit/product_cubit.dart';
import 'package:nti_laptop_api/features/home_view/data/product_model.dart';
import 'package:nti_laptop_api/features/home_view/views/screen/detalis_view.dart';

class BodyBuilderCard extends StatelessWidget {
  const BodyBuilderCard({
    super.key,
    required this.state,
    required this.index,
    this.context,
    required this.productData,
  });

  final ProductModel productData;
  final ProductLoadedState state;
  final int index;
  final dynamic context;

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<FavCubit>(context);
    final size = MediaQuery.of(context).size;
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
                          const SizedBox(width: 8),
                          IconButton(
                            onPressed: () {
                              cubit.addFavCubit(productData.id);
                            },
                            icon: Icon(Icons.favorite, color: Colors.red),
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
