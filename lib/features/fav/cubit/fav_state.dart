import 'package:nti_laptop_api/features/fav/data/fav_list_model.dart';

sealed class FavState {
  const FavState();
}

final class FavInitial extends FavState {}

final class FavLoading extends FavState {}

final class FavLoaded extends FavState {}

final class FavError extends FavState {
  final String error;

  const FavError({required this.error});
}

final class FavSuccess extends FavState {
  final List<FavListModel> list;

  const FavSuccess({required this.list});
}

final class FavAdd extends FavState {}
