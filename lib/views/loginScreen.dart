// ignore_for_file: file_names, avoid_unnecessary_containers, sized_box_for_whitespace, avoid_print

import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:order_processing/views/ForgotScreen.dart';
import 'package:order_processing/views/homeScreen.dart';
import 'package:order_processing/views/signupScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Order Processing'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  FadeInRight(
                    duration: const Duration(milliseconds: 1500),
                    child: Container(
                      height: MediaQuery.of(context).size.height / 4,
                      width: MediaQuery.of(context).size.width,
                      child: const Image(
                        image: AssetImage('assets/images/welcome1.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  FadeInLeft(
                    duration: const Duration(milliseconds: 1800),
                    child: TextFormField(
                      controller: loginEmailController,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        labelText: 'Email',
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FadeInLeft(
                    duration: const Duration(milliseconds: 1800),
                    child: TextFormField(
                      controller: loginPasswordController,
                      obscureText: obscureText,
                      decoration: InputDecoration(
                        hintText: 'Passsword',
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.password),
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                obscureText = !obscureText;
                              });
                            },
                            child: obscureText
                                ? const Icon(Icons.visibility)
                                : const Icon(Icons.visibility_off)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () {
                        Get.to(const ForgotScreen());
                      },
                      child: const Text('Forgot Password'),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1500),
                    child: ElevatedButton(
                        onPressed: () async {
                          var loginEmail = loginEmailController.text.trim();
                          var loginPassword =
                              loginPasswordController.text.trim();

                              EasyLoading.show();
                          try {
                            final User? firebaseUser = (await FirebaseAuth
                                    .instance
                                    .signInWithEmailAndPassword(
                                        email: loginEmail,
                                        password: loginPassword))
                                .user;
                            if (firebaseUser != null) {
                              Get.to(()=> const HomeScreen());
                              EasyLoading.dismiss();

                            } else {
                              print('Check Email & Password');
                              EasyLoading.dismiss();
                            }
                          } on FirebaseAuthException catch (e) {
                            print('Errer $e');
                              EasyLoading.dismiss();

                          }
                        },
                        child: const Text('Login')),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Card(
                    child: Container(
                      child: TextButton(
                        onPressed: () {
                          Get.to(const SignupScreen());
                        },
                        child: const Text(
                          "Don't have an account SignUp",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
