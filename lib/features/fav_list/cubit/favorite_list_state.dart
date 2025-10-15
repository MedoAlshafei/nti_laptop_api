part of 'favorite_list_cubit.dart';

sealed class FavoriteListState extends Equatable {
  const FavoriteListState();

  @override
  List<Object> get props => [];
}

final class FavoriteListInitial extends FavoriteListState {}

final class FavoriteListLoading extends FavoriteListState {}

final class FavoriteListSuccess extends FavoriteListState {
  final List<ProductModel> products;

  @override
  List<Object> get props => [products];

  const FavoriteListSuccess(this.products);
}

final class FavoriteListError extends FavoriteListState {
  final String error;

  @override
  List<Object> get props => [error];

  const FavoriteListError(this.error);
}
