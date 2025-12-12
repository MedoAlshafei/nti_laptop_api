import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      toolbarHeight: 100,
      scrolledUnderElevation: 0,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Browse Laptops", style: theme.textTheme.titleLarge),
          const SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              prefixIcon: Icon(Icons.search, color: theme.hintColor),
              hintStyle: TextStyle(
                fontSize: 16,
                color: theme.hintColor,
                fontWeight: FontWeight.w700,
              ),
              fillColor: theme.colorScheme.surface,
              filled: true,
              hintText: "Search",
            ),
          ),
        ],
      ),
    );
  }
}
