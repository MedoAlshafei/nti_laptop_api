import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nti_laptop_api/features/cart_item/data/cart_data.dart';
import 'package:nti_laptop_api/features/cart_item/data/cart_model.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final CartData cartData = CartData();

  getCartCubit() async {
    try {
      emit(CartLoading());
      final data = await cartData.getCartData();
      emit(CartLoaded(cartList: data));
    } catch (e) {
      emit(CartError(error: e.toString()));
    }
  }

  addCartCubit(String productId) async {
    try {
      emit(CartLoading());
      await cartData.addCartData(productId);
      emit(CartLoading());
      await getCartCubit();
    } catch (e) {
      emit(CartError(error: e.toString()));
    }
  }

  updateCartCubit() async {
    try {
      emit(CartLoading());
      await getCartCubit();
      emit(CartLoading());
    } catch (e) {
      emit(CartError(error: e.toString()));
    }
  }

  deleteCartCubit(String productId) async {
    try {
      emit(CartLoading());
      await cartData.deleteCartData(productId);
      emit(CartLoading());
      await getCartCubit();
    } catch (e) {
      emit(CartError(error: e.toString()));
    }
  }
}
