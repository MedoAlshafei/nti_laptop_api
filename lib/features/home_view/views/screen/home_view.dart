import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_laptop_api/features/home_view/cubit/product_cubit.dart';
import 'package:nti_laptop_api/features/home_view/views/widgets/app_bar.dart';
import 'package:nti_laptop_api/features/home_view/views/widgets/body_builder_card.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is ProductLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProductLoadedState) {
            return Scaffold(
              backgroundColor: Color(0xffF8FAFC),
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(100),
                child: CustomAppBar(),
              ),
              body: ListView.builder(
                itemCount: state.listProduct.length,
                itemBuilder: (context, index) {
                  return BodyBuilderCard(
                    state: state,
                    index: index,
                    context: context,
                    productData: state.listProduct[index],
                  );
                },
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
