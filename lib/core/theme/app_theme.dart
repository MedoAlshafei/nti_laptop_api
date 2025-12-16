import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white24,
      foregroundColor: Colors.black,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      iconTheme: IconThemeData(color: Colors.black),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      enableFeedback: true,
      elevation: 0,
      
    ),
    // navigationBarTheme: NavigationBarThemeData(
    //   backgroundColor: Colors.white,
    //   elevation: 0,
    //   indicatorColor: Colors.grey[300],
    //   labelTextStyle: WidgetStateProperty.all(
    //     TextStyle(
    //       fontSize: 14,
    //       fontWeight: FontWeight.w500,
    //       color: Colors.black,
    //     ),
    //   ),
    // ),
  );
}
