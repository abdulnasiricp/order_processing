// ignore_for_file: file_names, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_processing/views/loginScreen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
                          onPressed: () {
                            Get.to('');
                          }, child: const Text('Sign Up'))),
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
