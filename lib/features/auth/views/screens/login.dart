import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_laptop_api/core/util/validator.dart';
import 'package:nti_laptop_api/features/auth/cubit/auth_cubit.dart';
import 'package:nti_laptop_api/features/auth/views/widgets/custom_text_from_field.dart';
import 'package:nti_laptop_api/features/my_app.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    // final width = size.width;

    return Scaffold(
      backgroundColor: Color(0xfff8fafc),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome Back",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: height * 0.02),
            Text(
              "Sign in to continue shopping",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: height * 0.02),
            CustomTextFromField(
              emailcontroller: emailcontroller,
              labelText: 'Email',
              hintText: 'Enter your email',
              prefixIcon: Icon(Icons.email),
              validator: MyValidators.emailValidator,
            ),
            SizedBox(height: height * 0.02),
            CustomTextFromField(
              emailcontroller: passwordcontroller,
              labelText: 'Password',
              hintText: 'Enter your password',
              prefixIcon: Icon(Icons.lock),
              validator: MyValidators.passwordValidator,
              obscureText: true,
            ),
            SizedBox(height: height * 0.02),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff1B3AA0),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
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
                if (state is LoginFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(state.message),
                    ),
                  );
                }
              },
              builder: (context, state) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff1B3AA0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    fixedSize: Size(200, 50),
                    elevation: 5,
                  ),
                  onPressed: state is LoginLoading
                      ? null
                      : () {
                          BlocProvider.of<AuthCubit>(context).loginAuthCubit(
                            emailcontroller.text,
                            passwordcontroller.text,
                          );
                        },
                  child: state is LoginLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text('Login', style: TextStyle(color: Colors.white)),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
