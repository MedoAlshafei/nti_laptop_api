import 'package:bloc/bloc.dart';
import 'package:nti_laptop_api/features/fav/cubit/fav_state.dart';
import 'package:nti_laptop_api/features/fav/data/fav_data.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavInitial());

  final FavData favData = FavData();

  addFavCubit(String productId) async {
    try {
      emit(FavLoading());
      await favData.addFavData(productId);
      emit(FavAdd());
      await getFavCubit(); // Reload favs after add
    } catch (e) {
      emit(FavError(error: e.toString()));
    }
  }

  removeFavCubit(String productId) async {
    try {
      emit(FavLoading());
      await favData.removeFavData(productId);
      emit(FavAdd());
      await getFavCubit();
    } catch (e) {
      emit(FavError(error: e.toString()));
    }
  }

  getFavCubit() async {
    try {
      emit(FavLoading());
      final data = await favData.getFavData();
      emit(FavSuccess(list: data));
      print(data[0]);
    } catch (e) {
      emit(FavError(error: e.toString()));
    }
  }
}
