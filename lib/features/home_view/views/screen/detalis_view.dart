import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_laptop_api/features/cart_item/cubit/cart_cubit.dart';
import 'package:nti_laptop_api/features/fav/cubit/fav_cubit.dart';
import 'package:nti_laptop_api/features/home_view/data/product_model.dart';
import 'package:nti_laptop_api/features/home_view/views/widgets/details_section_builder.dart';

class DetalisView extends StatelessWidget {
  const DetalisView({super.key, required this.productData});

  final ProductModel productData;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final cubitCart = context.read<CartCubit>();

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => FavCubit()),
      ],

      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Laptops Details", style: theme.textTheme.titleLarge),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    //Images ListView Builder
                    SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productData.images.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Image.network(
                                productData.images[index],
                                height: 300,
                                fit: BoxFit.fitWidth,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Product Details Section Builder
                    _builderProductDetailsSection(theme, context),
                    const SizedBox(height: 10),

                    // Details Section builder
                    DetailsSectionBuilder(
                      theme: theme,
                      productData: productData,
                    ),

                    const SizedBox(height: 10),
                    // Row(
                    //   children: [
                    //     Text(
                    //       "Quantity",
                    //       style: TextStyle(
                    //         color: Colors.black,
                    //         fontSize:
                    //             theme.textTheme.titleMedium?.fontSize ?? 16,
                    //         fontWeight: FontWeight.bold,
                    //       ),
                    //     ),
                    //     const SizedBox(width: 10),
                    //     Container(
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(16),
                    //         border: Border.all(color: Colors.grey, width: 2),
                    //       ),
                    //       child: Row(
                    //         children: [
                    //           IconButton(
                    //             onPressed: () => cubitCart.decrementQuantity(),
                    //             icon: Icon(Icons.remove),
                    //           ),
                    //           Text(
                    //             '1',
                    //             style: TextStyle(
                    //               fontSize:
                    //                   theme.textTheme.titleMedium?.fontSize ??
                    //                   16,
                    //               fontWeight: FontWeight.bold,
                    //             ),
                    //           ),
                    //           IconButton(
                    //             onPressed: () => cubitCart.incrementQuantity(),
                    //             icon: Icon(Icons.add),
                    //           ),
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    SizedBox(height: size.height * 0.12),
                  ],
                ),
              ),
            ),
            floatingActionButton: ElevatedButton(
              onPressed: () => cubitCart.addCartCubit(productData.id),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(size.width * 0.92, 60),
                padding: EdgeInsets.symmetric(horizontal: 16),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                backgroundColor: theme.colorScheme.primary,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.add_shopping_cart,
                    color: theme.colorScheme.onPrimary,
                    size: 24,
                  ),
                  Text(
                    "Add to cart",
                    style: TextStyle(
                      fontSize: theme.textTheme.titleLarge?.fontSize ?? 24,
                      fontWeight: FontWeight.w600,
                      color: theme.colorScheme.onPrimary,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Row _builderProductDetailsSection(ThemeData theme, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(productData.name, style: theme.textTheme.titleLarge),
            Text(
              "\$${productData.price.toString()}",
              style: TextStyle(
                fontSize: theme.textTheme.headlineSmall?.fontSize ?? 24,
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.primary,
              ),
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            BlocProvider.of<FavCubit>(context).addFavCubit(productData.id);
          },
          icon: Icon(Icons.favorite, color: theme.colorScheme.error),
        ),
      ],
    );
  }
}
