import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_laptop_api/core/widget/validator.dart';
import 'package:nti_laptop_api/features/auth/cubit/auth_cubit.dart';
import 'package:nti_laptop_api/core/widget/custom_text_from_field.dart';
import 'package:nti_laptop_api/features/auth/views/widgets/listener.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController gendercontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController nationalIdcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;

    final cubit = BlocProvider.of<AuthCubit>(context);

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Color(0xfff8fafc),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    "Sign in to continue shoppibng",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: cubit.imageFile != null
                            ? FileImage(cubit.imageFile!)
                            : null,
                        radius: 50,
                        // child: Icon(Icons.person, size: 50),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: IconButton(
                          onPressed: () {
                            BlocProvider.of<AuthCubit>(context).addImage();
                          },
                          icon: Icon(Icons.add_a_photo, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  CustomTextFromField(
                    emailcontroller: namecontroller,
                    textInputType: TextInputType.name,
                    labelText: 'Name',
                    hintText: 'Enter your Name',
                    prefixIcon: Icon(Icons.person),
                    validator: (value) {
                      return MyValidators.displayNamevalidator(value);
                    },
                  ),
                  SizedBox(height: height * 0.02),
                  CustomTextFromField(
                    emailcontroller: passwordcontroller,
                    textInputType: TextInputType.visiblePassword,
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    prefixIcon: Icon(Icons.lock),
                    validator: (value) {
                      return MyValidators.passwordValidator(value);
                    },
                    obscureText: false,
                  ),
                  SizedBox(height: height * 0.02),
                  CustomTextFromField(
                    emailcontroller: emailcontroller,
                    textInputType: TextInputType.emailAddress,
                    labelText: 'Email',
                    hintText: 'Enter your email',
                    prefixIcon: Icon(Icons.email),
                    validator: (value) {
                      return MyValidators.emailValidator(value);
                    },
                    obscureText: false,
                  ),
                  SizedBox(height: height * 0.02),
                  CustomTextFromField(
                    emailcontroller: phonecontroller,
                    textInputType: TextInputType.phone,
                    labelText: 'Phone Number',
                    hintText: 'Enter your phone number',
                    prefixIcon: Icon(Icons.phone),
                    validator: (value) {
                      return MyValidators.phoneValidator(value);
                    },
                    obscureText: false,
                  ),
                  SizedBox(height: height * 0.02),
                  CustomTextFromField(
                    emailcontroller: nationalIdcontroller,
                    textInputType: TextInputType.number,
                    labelText: 'National Id',
                    hintText: 'Enter your National Id',
                    prefixIcon: Icon(Icons.numbers),
                    validator: (value) {
                      return MyValidators.nationalIdValidator(value);
                    },
                    obscureText: false,
                  ),
                  SizedBox(height: height * 0.02),
                  CustomTextFromField(
                    emailcontroller: gendercontroller,
                    textInputType: TextInputType.name,
                    labelText: 'Gender',
                    hintText: 'Enter your Gender',
                    prefixIcon: Icon(Icons.person),
                    validator: (value) {
                      return MyValidators.displayNamevalidator(value);
                    },
                    obscureText: false,
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
                    listener: listener,
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
                        onPressed: state is AuthLoading
                            ? null
                            : () {
                                BlocProvider.of<AuthCubit>(
                                  context,
                                ).registerAuthCubit(
                                  namecontroller.text,
                                  emailcontroller.text,
                                  passwordcontroller.text,
                                  nationalIdcontroller.text,
                                  phonecontroller.text,
                                  gendercontroller.text,
                                  BlocProvider.of<AuthCubit>(
                                    context,
                                  ).profileImage,
                                );
                              },
                        child: state is AuthLoading
                            ? CircularProgressIndicator(color: Colors.white)
                            : Text(
                                'Login',
                                style: TextStyle(color: Colors.white),
                              ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
