import 'package:bloc/bloc.dart';
import 'package:nti_laptop_api/features/fav/cubit/fav_state.dart';
import 'package:nti_laptop_api/features/fav/data/fav_data.dart';
import 'package:nti_laptop_api/features/fav/data/fav_list_model.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavInitial());

  final FavData favData = FavData();

  addFavCubit(String productId) async {
    emit(FavLoading());
    try {
      String message = await favData.addFavData(productId);
      emit(FavSuccess(successMsg: message));
      print(message);
    } catch (e) {
      emit(FavError(error: e.toString()));
    }
  }

  removeFavCubit(String productId) async {
    emit(FavLoading());
    try {
      String message = await favData.removeFavData(productId);
      emit(FavSuccess(successMsg: message));
      print(message);
    } catch (e) {
      emit(FavError(error: e.toString()));
    }
  }

  getFavCubit() async {
    emit(FavLoading());
    try {
      List<FavListModel> data = await favData.getFavData();
      emit(FavSuccess(successMsg: data.toString()));
      print(data);
    } catch (e) {
      emit(FavError(error: e.toString()));
    }
  }
}
