import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_laptop_api/features/home_view/cubit/product_cubit.dart';
import 'package:nti_laptop_api/features/home_view/views/screen/detalis_view.dart';
import 'package:nti_laptop_api/features/home_view/views/widgets/app_bar.dart';

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
                  return _bodyBuilderCard(state, index, context);
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

Card _bodyBuilderCard(ProductLoadedState state, int index, context) {
  return Card(
    margin: const EdgeInsets.all(16),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    elevation: 5,
    color: Colors.grey[100],
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DetalisView(productData: state.listProduct[index]),
          ),
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.network(
                  state.listProduct[index].image,
                  fit: BoxFit.fitWidth,
                  // width: double.infinity,
                  height: 200,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.white,
            ),
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    state.listProduct[index].name,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  state.listProduct[index].description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: const TextStyle(fontSize: 15),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Price:",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Card(
                          color: Colors.grey[300],
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              state.listProduct[index].price.toString(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          state.listProduct[index].status,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: state.listProduct[index].status == "New"
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
