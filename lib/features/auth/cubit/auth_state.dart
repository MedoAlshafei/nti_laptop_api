part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class LoginSuccess extends AuthState {
  final dynamic data;

  const LoginSuccess({required this.data});
}

final class LoginLoading extends AuthState {}

final class LoginFailure extends AuthState {
  final String message;
  const LoginFailure({required this.message});
  @override
  List<Object> get props => [message];
}
