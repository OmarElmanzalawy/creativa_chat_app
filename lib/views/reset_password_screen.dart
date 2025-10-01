import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal:  25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Provide recovery email",style: TextStyle(fontSize: 22),),
              const SizedBox(height: 10,),
              CustomTextField(
                hintText: "enter your recovery email",
                labelText: "email",
                controller: _emailController
                ),
                CustomButton(
                  text: "Send recovery email",
                 onPressed: (){
                  AuthService.sendResetEmail(_emailController.text,context);
                 },
                 )
            ],
          ),
        ),
      ),
    );
  }
}