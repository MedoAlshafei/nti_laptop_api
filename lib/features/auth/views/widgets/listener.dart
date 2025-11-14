import 'package:flutter/material.dart';
import 'package:nti_laptop_api/features/auth/cubit/auth_cubit.dart';
import 'package:nti_laptop_api/features/my_app.dart';

void listener(BuildContext context, state) {
  if (state is AuthSuccess) {
    if (state.data['status'] == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(state.data['message']),
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyHomeApp()),
      );
    }
    if (state.data['status'] == 'error') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(state.data['message']),
        ),
      );
    }
  }
  if (state is AuthFailure) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: Colors.red, content: Text(state.message)),
    );
  }
}
