sealed class FavState {}

final class FavInitial extends FavState {}

final class FavLoading extends FavState {}

final class FavError extends FavState {
  String error;

  FavError({required this.error});
}

final class FavSuccess extends FavState {
  String successMsg;

  FavSuccess({required this.successMsg});
}
