import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.white24,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Browse Laptops",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              prefixIcon: Icon(Icons.search, color: Colors.grey[500]),
              hintStyle: TextStyle(
                fontSize: 16,
                color: Colors.grey[500],
                fontWeight: FontWeight.w700,
              ),
              fillColor: Colors.white,
              filled: true,
              hintText: "Search",
            ),
          ),
        ],
      ),
    );
  }
}
