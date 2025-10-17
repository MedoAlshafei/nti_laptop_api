part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class Cartadd extends CartState {}

final class CartRemove extends CartState {}

final class CartUpdate extends CartState {
  final int quantity;

  const CartUpdate(this.quantity);
  @override
  List<Object> get props => [quantity];
}
