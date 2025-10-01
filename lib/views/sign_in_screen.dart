import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/views/sign_up_screen.dart';
import 'package:chat_app/widgets/custom_button.dart';
import 'package:chat_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _passwordController = TextEditingController();

  final _emailController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 90,),
 const Text(
                  'Welcome Back',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Sign in to continue our chat app',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 32),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CustomTextField(
                          hintText: 'Enter your email',
                          labelText: 'email',
                          controller: _emailController,
                          prefixIcon: Icons.mail,
                          // validator: (value){
                          //   if (value == null || value.isEmpty) {
                          //     return 'Please enter a username';
                          //   }
                          //   if (value.length < 3) {
                          //     return 'Username must be at least 3 characters';
                          //   }
                          //   return null;
                          // },
                        ),
                        CustomTextField(
                          hintText: 'Enter your password',
                          labelText: 'Password',
                          controller: _passwordController,
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: Icons.lock,
                          validator: (value){
                            if (value == null || value.isEmpty) {
                              return 'Please enter an email';
                            }
                            return null;
                          },
                        ),
                    
                        const SizedBox(height: 24),
                         CustomButton(
                          text: 'Sign In',
                          onPressed: ()async{
                            
                            AuthService.login(
                              email: _emailController.text, password: _passwordController.text, context: context);
                            
                          },
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an account? ',
                              style: TextStyle(color: Colors.grey),
                            ),
                            GestureDetector(
                              onTap: () {
                               Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context) => SignUpScreen(),), (route) => false);
                              },
                              child: const Text(
                                'Sign In',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
          ],
        ),
      ),
                ),

               
          ],
                ),
      )
    );
  }
}