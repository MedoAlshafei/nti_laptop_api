import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_laptop_api/features/fav/cubit/fav_cubit.dart';
import 'package:nti_laptop_api/features/home_view/cubit/product_cubit.dart';
import 'package:nti_laptop_api/features/home_view/views/screen/home_view.dart';

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
        // BlocProvider(create: (context) => FavCubit()),
        BlocProvider(create: (context) => FavCubit()..getFavCubit()),
      ],
      child: MaterialApp(home: Scaffold(body: HomeView())),
    );
  }
}
