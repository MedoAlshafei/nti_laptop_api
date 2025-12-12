import 'package:flutter/material.dart';
import 'package:nti_laptop_api/features/home_view/data/product_model.dart';

class DetailsSectionBuilder extends StatelessWidget {
  const DetailsSectionBuilder({
    super.key,
    required this.theme,
    required this.productData,
  });

  final ThemeData theme;
  final ProductModel productData;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.grey[50],
        border: Border.all(
          color: Colors.grey.shade300,
          width: 2,
        ),
      ),
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Description:',
                style: TextStyle(
                  fontSize:
                      theme
                          .textTheme
                          .headlineMedium
                          ?.fontSize ??
                      24,
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.primary,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                productData.description,
                style: theme.textTheme.headlineSmall,
                textAlign: TextAlign.start,
              ),
            ],
          ),
          Divider(color: Colors.grey.shade300, thickness: 2),
          DetailsBuilder(text: 'Category:', value: productData.category, theme: theme),
          Divider(color: Colors.grey.shade300, thickness: 2),
          DetailsBuilder(text: 'Company:', value: productData.company, theme: theme),
          Divider(color: Colors.grey.shade300, thickness: 2),
          DetailsBuilder(text: 'Sales:', value: productData.sales.toString(), theme: theme),
        ],
      ),
    );
  }
}

class DetailsBuilder extends StatelessWidget {
  const DetailsBuilder({
    super.key,
    required this.text,
    required this.value,
    required this.theme,
  });

  final String text;
  final String value;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: theme.textTheme.bodyLarge?.fontSize ?? 16,
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.secondary,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: theme.textTheme.bodyMedium?.fontSize ?? 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
