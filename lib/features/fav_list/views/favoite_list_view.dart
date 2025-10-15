import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_laptop_api/features/fav_list/cubit/favorite_list_cubit.dart';

class FavoiteListView extends StatelessWidget {
  const FavoiteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Favorite List"), centerTitle: true),
      body: BlocBuilder<FavoriteListCubit, FavoriteListState>(
        builder: (context, state) {
          if (state is FavoriteListLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is FavoriteListError) {
            return Center(child: Text("Error: ${state.error}"));
          } else if (state is FavoriteListSuccess) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.products[index].name),
                  subtitle: Text(state.products[index].description),
                );
              },
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
