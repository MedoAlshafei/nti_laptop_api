import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile"), centerTitle: true),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
              SizedBox(height: 20),
              CustomTextField(text: "Name"),
              SizedBox(height: 20),
              CustomTextField(text: "Email"),
              SizedBox(height: 20),
              CustomTextField(text: "Password"),
              SizedBox(height: 20),
              CustomTextField(text: "Phone Number"),
              SizedBox(height: 20),
              CustomTextField(text: "National Id"),
              SizedBox(height: 20),
              CustomTextField(text: "Gender"),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xfff8fafc),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Color(0xff1B3AA0)),
          gapPadding: 16,
        ),
      ),
    );
  }
}
