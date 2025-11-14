import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nti_laptop_api/features/auth/data/auth_data.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final AuthData authData = AuthData();

  static AuthCubit get(context) => context.read<AuthCubit>();

  ImagePicker picker = ImagePicker();
  File? imageFile;
  Uint8List? bytes;
  String? profileImage;
  addImage() async {
    final pickedImage = await picker.pickImage(source: ImageSource.camera);

    imageFile = File(pickedImage!.path);
    bytes = imageFile!.readAsBytesSync();
    profileImage = base64Encode(bytes!);
    emit(UpdateImage());
  }

  loginAuthCubit(String email, dynamic password) async {
    emit(AuthLoading());
    try {
      var repo = await AuthData.loginAuthData(email, password);
      if (repo == null || repo["status"] == "error") {
        emit(
          AuthFailure(message: repo?['message'] ?? 'Unknown error occurred'),
        );
      } else {
        emit(AuthSuccess(data: repo));
      }
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }

  registerAuthCubit(
    String name,
    String email,
    String password,
    String nationalId,
    String phone,
    String gender,
    String? profileImage,
  ) async {
    emit(AuthLoading());
    try {
      var repo = await AuthData.registerAuthData(
        name,
        email,
        password,
        nationalId,
        phone,
        gender,
        profileImage,
      );
      if (repo == null || repo["status"] == "error") {
        emit(
          AuthFailure(message: repo?['message'] ?? 'Unknown error occurred'),
        );
      } else {
        emit(AuthSuccess(data: repo));
      }
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }
}
