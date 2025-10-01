import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nti_laptop_api/features/home_view/data/model/product_model.dart';
import 'package:nti_laptop_api/features/home_view/presentation/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: HomeView()));
  }
}
