import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_laptop_api/features/cart_item/cubit/cart_cubit.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shopping card",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[500],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CartError) {
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
          } else if (state is CartLoaded) {
            if (state.cartList.isEmpty) {
              return Center(
                child: Text(
                  'No favorite items found.',
                  style: TextStyle(fontSize: 18),
                ),
              );
            } else {
              return SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: state.cartList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Image.network(
                        state.cartList[index].image,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                      title: Text(state.cartList[index].name),
                      // subtitle: Text(state.cartList[index].description),
                      trailing: IconButton(
                        onPressed: () {
                          BlocProvider.of<CartCubit>(
                            context,
                          ).deleteCartCubit(state.cartList[index].id);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    );
                  },
                ),
              );
            }
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
