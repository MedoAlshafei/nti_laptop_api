import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_laptop_api/features/cart_item/cubit/cart_cubit.dart';
import 'package:nti_laptop_api/features/fav/cubit/fav_cubit.dart';
import 'package:nti_laptop_api/features/fav/cubit/fav_state.dart';

class FavoiteListView extends StatelessWidget {
  const FavoiteListView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<CartCubit>(context);
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: AppBar(
        title: Column(
          children: [
            const Text(
              "Favorites",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              "0 items saved",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
        // centerTitle: true,
        backgroundColor: Colors.white24,
      ),
      body: BlocBuilder<FavCubit, FavState>(
        builder: (context, state) {
          if (state is FavLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FavError) {
            return SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Error: ${state.error}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is FavSuccess) {
            if (state.list.isEmpty) {
              return Center(
                child: Text(
                  'No favorite items found.',
                  style: TextStyle(fontSize: 18),
                ),
              );
            }
            return SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: ListView.builder(
                itemCount: state.list.length,
                itemBuilder: (context, index) {
                  return _bodyBuilderCard(state, index, context, () {
                    cubit.addCartCubit(state.list[index].id);
                  });
                },
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _bodyBuilderCard(
    FavSuccess state,
    int index,
    context,
    void Function() onTap,
  ) {
    final cubit = BlocProvider.of<FavCubit>(context);
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color.fromARGB(255, 210, 210, 210)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Image.network(
                state.list[index].image,
                fit: BoxFit.contain,
                height: 90,
                width: 90,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                state.list[index].name,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "\$${state.list[index].price.toString()}",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: onTap,
                    clipBehavior: Clip.antiAlias,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(170, 40),
                      backgroundColor: Color(0xff1B3AA0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart_outlined, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          "Add to Cart",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 16),
                  InkWell(
                    onTap: () {
                      cubit.removeFavCubit(state.list[index].id);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 245, 245, 245),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey, width: 2),
                      ),
                      child: Icon(Icons.delete, color: Colors.red),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
