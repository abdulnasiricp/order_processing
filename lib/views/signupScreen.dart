// ignore_for_file: file_names, avoid_unnecessary_containers, sized_box_for_whitespace, non_constant_identifier_names

import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:order_processing/views/loginScreen.dart';

import '../services/signUpService.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController SignupEmailController = TextEditingController();
  TextEditingController SignupPasswordController = TextEditingController();

  User? currentUser = FirebaseAuth.instance.currentUser;
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
                      controller: usernameController,
                      decoration: InputDecoration(
                        hintText: 'UserName',
                        labelText: 'UserName',
                        prefixIcon: const Icon(Icons.person),
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
                      controller: SignupEmailController,
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
                      controller: SignupPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Passsword',
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.password),
                        suffixIcon: const Icon(Icons.visibility),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FadeInUp(
                      duration: const Duration(milliseconds: 1500),
                      child: ElevatedButton(
                          onPressed: () async {
                            var userName = usernameController.text.trim();
                            var userEmail = SignupEmailController.text.trim();
                            var userPassword =
                                SignupPasswordController.text.trim();

                                EasyLoading.show();

                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                  email: userEmail,
                                  password: userPassword,
                                )
                                .then(
                                  (value) => {
                                    SignUpUser(
                                      userName,
                                      userEmail,
                                      userPassword,
                                    )
                                  },
                                );
                          },
                          child: const Text('Sign Up'))),
                  const SizedBox(
                    height: 30,
                  ),
                  Card(
                    child: Container(
                      child: TextButton(
                        onPressed: () {
                          Get.to(const LoginScreen());
                        },
                        child: const Text(
                          "Already have an account SignIn",
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
