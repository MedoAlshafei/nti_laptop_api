part of 'cart_cubit.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  final List<CardModel> cartList;

  const CartLoaded({required this.cartList});
  @override
  List<Object> get props => [cartList];
}

final class CartError extends CartState {
  final String error;

  const CartError({required this.error});
  @override
  List<Object> get props => [error];
}

final class CartUpdate extends CartState {
  final int quantity;

  const CartUpdate(this.quantity);
  @override
  List<Object> get props => [quantity];
}
