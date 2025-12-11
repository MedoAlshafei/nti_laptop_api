import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_laptop_api/features/auth/cubit/auth_cubit.dart';
import 'package:nti_laptop_api/features/cart_item/cubit/cart_cubit.dart';
import 'package:nti_laptop_api/features/fav/cubit/fav_cubit.dart';
import 'package:nti_laptop_api/features/home_view/cubit/product_cubit.dart';
import 'package:nti_laptop_api/features/my_app.dart';
import 'package:nti_laptop_api/features/nav_bar/cubit/nav_bar_cubit.dart';
import 'package:nti_laptop_api/core/theme/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductCubit()..getProductData()),
        BlocProvider(create: (context) => FavCubit()..getFavCubit()),
        BlocProvider(create: (context) => AuthCubit()..loginAuthCubit),
        BlocProvider(create: (context) => CartCubit()..getCartCubit()),
        BlocProvider(create: (context) => NavBarCubit()),
      ],
      child: MaterialApp(
        theme: AppTheme.lightTheme,
        home: Scaffold(body: MyHomeApp()),
      ),
    );
  }
}
