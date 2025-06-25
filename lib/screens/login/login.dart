import 'package:ecobin/screens/home/home.dart';
import 'package:ecobin/screens/login/login_user.dart';
import 'package:ecobin/screens/register/register.dart';
import 'package:ecobin/shared/button.dart';
import 'package:ecobin/shared/text_form.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 230,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/recycle_symbol.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 230,
                color: Color.fromRGBO(84, 180, 104, 0.8),
              ),
              Positioned(
                top: 70,
                left: 20,
                right: 20,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Back!',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Fill the form to continue.',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    // input for users Email
                    TextForm(
                      'Email',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20),

                    // input for users Password
                    TextForm(
                      'Password',
                      controller: _passwordController,
                      isPassword: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters above';
                        }
                        if (value.length > 20) {
                          return 'Password must be at most not be more 20 characters';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20),

                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'Forget Password?',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color.fromRGBO(84, 180, 105, 1),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    // Login Button
                    SubmitButton(
                      'Login',
                      isLoading: isLoading,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() => isLoading = true);

                          _formKey.currentState!.save();

                          await Future.delayed(Duration(seconds: 2));

                          final result = await loginUser(
                            email: _emailController.text.trim(),
                            password: _passwordController.text.trim(),
                          );

                          if (result['success'] = true) {
                            print('Login Successful, navigating ');

                            _formKey.currentState!.reset();

                            _emailController.clear();
                            _passwordController.clear();

                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => Home(result['user']['name']),
                              ),
                              (route) => false,
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(result['message']),
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                backgroundColor: Colors.green,
                                action: SnackBarAction(
                                  label: 'Close',
                                  onPressed: () {},
                                  textColor: Colors.white,
                                ),
                              ),
                            );
                            print(
                              'User Registration failed: ${result['message']}',
                            );
                          }

                          setState(() => isLoading = false);
                        }
                      },
                    ),
                    SizedBox(height: 20),

                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          text: 'Don\'t have an account?',
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: ' Create Account',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 16,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (ctx) => Register(),
                                    ),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
