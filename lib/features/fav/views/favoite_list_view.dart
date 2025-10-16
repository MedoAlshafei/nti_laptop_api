import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_laptop_api/features/fav/cubit/fav_cubit.dart';
import 'package:nti_laptop_api/features/fav/cubit/fav_state.dart';

class FavoiteListView extends StatelessWidget {
  const FavoiteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        if (state is FavLoading) {
          return Scaffold(
            body: const Center(child: CircularProgressIndicator()),
          );
        } else if (state is FavError) {
          return Scaffold(body: Center(child: Text(state.error)));
        } else if (state is FavLoaded) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Shopping Cart",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.lightBlue[500],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            body: ListView.builder(
              itemCount: state.favListModel.length,
              itemBuilder: (context, index) {
                return _bodyBuilderCard(state, index, context);
              },
            ),
          );
        }
        return Scaffold(appBar: AppBar());
      },
    );
  }

  Card _bodyBuilderCard(FavLoaded state, int index, context) {
    return Card(
      margin: const EdgeInsets.all(16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      elevation: 5,
      color: Colors.grey[100],
      child: InkWell(
        onTap: () {},
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
                    state.favListModel[index].image,
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
                      state.favListModel[index].name,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    state.favListModel[index].description,
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
                                state.favListModel[index].price.toString(),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            state.favListModel[index].status,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: state.favListModel[index].status == "New"
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

  // Widget build(BuildContext context) {
  //   return BlocBuilder<FavCubit, FavState>(
  //     builder: (context, state) {
  //       if (state is FavLoading) {
  //         return const Center(child: CircularProgressIndicator());
  //       } else if (state is FavError) {
  //         return Text(state.error);
  //       } else if (state is FavSuccess) {
  //         return Scaffold(
  //           appBar: AppBar(
  //             title: const Text(
  //               "Shopping Cart",
  //               style: TextStyle(
  //                 fontSize: 25,
  //                 fontWeight: FontWeight.bold,
  //                 color: Colors.white,
  //               ),
  //             ),
  //             centerTitle: true,
  //             backgroundColor: Colors.lightBlue[500],
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(25),
  //             ),
  //           ),
  //           body: Container(),
  //         );
  //       }
  //       return Scaffold(
  //         appBar: AppBar(
  //           title: const Text(
  //             "Shopping Cart",
  //             style: TextStyle(
  //               fontSize: 25,
  //               fontWeight: FontWeight.bold,
  //               color: Colors.black,
  //             ),
  //           ),
  //           centerTitle: true,
  //           backgroundColor: Colors.lightBlue[500],
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.circular(25),
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}
