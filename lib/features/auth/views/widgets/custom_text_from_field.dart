import 'package:flutter/material.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    super.key,
    required this.emailcontroller,
    required this.labelText,
    required this.hintText,
    required this.validator,
    required this.prefixIcon,
    this.obscureText = false,
  });

  final TextEditingController emailcontroller;
  final String? Function(String?)? validator;
  final String labelText;
  final String hintText;
  final Icon prefixIcon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        cursorColor: Color(0xff1B3AA0),
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        controller: emailcontroller,
        keyboardType: TextInputType.emailAddress,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(fontSize: 18),
        obscureText: obscureText,
        decoration: InputDecoration(
          floatingLabelStyle: TextStyle(color: Color(0xff1B3AA0)),
          labelStyle: TextStyle(color: Colors.grey[700]),
          hintStyle: TextStyle(color: Colors.grey[900], fontSize: 16),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          labelText: labelText,
          hintText: hintText,
          prefixIcon: prefixIcon,
        ),
        validator: validator,
      ),
    );
  }
}
