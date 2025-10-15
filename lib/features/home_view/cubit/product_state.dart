part of 'product_cubit.dart';

@immutable
sealed class ProductState {}

final class ProductInitialState extends ProductState {}

final class ProductLoadingState extends ProductState {}

final class ProductLoadedState extends ProductState {
  final List<ProductModel> listProduct;

  ProductLoadedState({required this.listProduct});
}
