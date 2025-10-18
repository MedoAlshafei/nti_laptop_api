import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_laptop_api/features/auth/cubit/auth_cubit.dart';
import 'package:nti_laptop_api/features/auth/views/screens/login.dart';
import 'package:nti_laptop_api/features/cart_item/cubit/cart_cubit.dart';
import 'package:nti_laptop_api/features/fav/cubit/fav_cubit.dart';
import 'package:nti_laptop_api/features/home_view/cubit/product_cubit.dart';

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
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        home: Scaffold(body: Login()),
      ),
    );
  }
}
