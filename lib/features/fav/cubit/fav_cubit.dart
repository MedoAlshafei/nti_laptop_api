import 'package:bloc/bloc.dart';
import 'package:nti_laptop_api/features/fav/cubit/fav_state.dart';
import 'package:nti_laptop_api/features/fav/model/fav_data.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavInitial());

  FavLoading favLoading = FavLoading();
  addFavCubit(String productId) async {
    emit(favLoading);
    try {
      String message = await FavData().addFavData(productId);
      emit(FavSuccess(successMsg: message));
    } catch (e) {
      emit(FavError(error: e.toString()));
    }
  }
}
