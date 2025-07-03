import 'package:ecobin/screens/home/home.dart';
import 'package:ecobin/screens/login/login.dart';
import 'package:ecobin/screens/register/register_user.dart';
import 'package:ecobin/services/api_services.dart';
import 'package:ecobin/shared/button.dart';
import 'package:ecobin/shared/modal.dart';
import 'package:ecobin/shared/text_form.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key, this.isRegistering = true});

  final bool isRegistering;

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  final apiServices = ApiService();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();

  bool isRegistering = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //   background image
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
                      'Let’s Get You Started',
                      style: TextStyle(
                        fontSize: 32,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Create an account to keep your\n environment clean.',
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
                    // input for users Name
                    TextForm(
                      'Full Name',
                      controller: _nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),

                    SizedBox(height: 20),

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

                    // input for users Phone Number
                    TextForm(
                      'Phone Number',
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your phone number';
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
                          return 'Please enter your password';
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

                    // Submit form
                    SubmitButton(
                      'Create Account',
                      isLoading: isRegistering,
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            isRegistering = true;
                          });

                          _formKey.currentState!.save();

                          try {
                            final result = await apiServices.register(
                              name: _nameController.text.trim(),
                              email: _emailController.text.trim(),
                              phone: _phoneController.text.trim(),
                              password: _passwordController.text.trim(),
                            );

                            if (result['success'] == true) {
                              // print('Registration Successful: ${result['user']}');

                              _formKey.currentState!.reset();

                              _nameController.clear();
                              _emailController.clear();
                              _passwordController.clear();
                              _phoneController.clear();

                              ShowModal.showModal(
                                context,
                                name: result['user']['name'],
                              );

                              // await Future.delayed(Duration(seconds: 1000));
                              //
                              // Navigator.pushAndRemoveUntil(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (ctx) =>
                              //         Home(result['user']['name']),
                              //   ),
                              //   (route) => false,
                              // );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(result['message']),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  backgroundColor: Colors.green,
                                  action: SnackBarAction(
                                    label: 'Close',
                                    textColor: Colors.white,
                                    onPressed: () {},
                                  ),
                                ),
                              );
                              print('Registration failed:${result['message']}');
                            }
                          } catch (e) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('An error occurred: $e'),
                                backgroundColor: Colors.red,
                              ),
                            );
                          } finally {
                            setState(() {
                              isRegistering = false;
                            });
                          }
                        }
                      },
                    ),

                    // Terms and conditions
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          text: 'By signing up, you agree to EcoBin’s',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          children: [
                            TextSpan(
                              text: ' Terms of \nService',
                              style: TextStyle(color: Colors.green, height: 2),
                            ),
                            TextSpan(text: ' and '),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    // text for already have an account
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          text: 'Already have an account?',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                          children: [
                            TextSpan(
                              text: ' Login',
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 16,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (ctx) => Login(),
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
