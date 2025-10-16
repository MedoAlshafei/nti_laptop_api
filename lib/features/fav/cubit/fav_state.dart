import 'package:nti_laptop_api/features/fav/data/fav_list_model.dart';

sealed class FavState {
  const FavState();
}

final class FavInitial extends FavState {}

final class FavLoading extends FavState {}

final class FavLoaded extends FavState {
  final List<FavListModel> favListModel;

  const FavLoaded({required this.favListModel});
}

final class FavError extends FavState {
  final String error;

  const FavError({required this.error});

  // @override
  // List<Object> get props => [error];
}

final class FavSuccess extends FavState {
  final String successMsg;

  const FavSuccess({required this.successMsg});

  // @override
  // List<Object> get props => [successMsg];
}
