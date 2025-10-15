import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nti_laptop_api/features/fav_list/data/favorite_list_data.dart';
import 'package:nti_laptop_api/features/home_view/data/product_model.dart';

part 'favorite_list_state.dart';

class FavoriteListCubit extends Cubit<FavoriteListState> {
  FavoriteListCubit() : super(FavoriteListInitial());

  updateFavoriteList() async {
    emit(FavoriteListLoading());
    try {
      List<ProductModel> products = await FavoriteListData().getFavoriteList();
      emit(FavoriteListSuccess(products));
    } catch (e) {
      emit(FavoriteListError(e.toString()));
    }
  }
}
