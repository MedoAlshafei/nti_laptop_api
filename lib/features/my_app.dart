import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_laptop_api/features/cart_item/views/screen/cart_view.dart';
import 'package:nti_laptop_api/features/fav/views/favoite_list_view.dart';
import 'package:nti_laptop_api/features/home_view/views/screen/home_view.dart';
import 'package:nti_laptop_api/features/nav_bar/cubit/nav_bar_cubit.dart';

class MyHomeApp extends StatelessWidget {
  const MyHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          switch (state.currentIndex) {
            case 0:
              return HomeView();
            case 1:
              return FavoiteListView();
            case 2:
              return CartView();
            default:
              return Container();
          }
        },
      ),
      bottomNavigationBar: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.currentIndex,
            onTap: (value) {
              context.read<NavBarCubit>().setSelectedIndex(value);
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: state.currentIndex == 0
                    ? Icon(Icons.home)
                    : Icon(Icons.home_outlined),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: state.currentIndex == 1
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_outline),
                label: "Fav",
              ),
              BottomNavigationBarItem(
                icon: state.currentIndex == 2
                    ? Icon(Icons.shopping_cart)
                    : Icon(Icons.shopping_cart_outlined),
                label: "Cart",
              ),
            ],
          );
        },
      ),
    );
  }
}
