import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nti_laptop_api/features/auth/data/auth_data.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  loginAuth(String email, dynamic password) async {
    emit(LoginLoading());
    try {
      var repo = await AuthData.loginAuth(email, password);
      if (repo == null || repo["status"] == "error") {
        emit(
          LoginFailure(message: repo?['message'] ?? 'Unknown error occurred'),
        );
      } else {
        emit(LoginSuccess(data: repo));
      }
    } catch (e) {
      emit(LoginFailure(message: e.toString()));
    }
  }
}
