import 'package:equatable/equatable.dart';

sealed class FavState extends Equatable {
  const FavState();

  @override
  List<Object> get props => [];
}

final class FavInitial extends FavState {}

final class FavLoading extends FavState {}

final class FavError extends FavState {
  final String error;

  const FavError({required this.error});

  @override
  List<Object> get props => [error];
}

final class FavSuccess extends FavState {
  final String successMsg;

  const FavSuccess({required this.successMsg});

  @override
  List<Object> get props => [successMsg];
}
