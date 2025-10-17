import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  cartAdd() {
    emit(Cartadd());
  }

  cartRemove() {
    emit(Cartadd());
  }
}
