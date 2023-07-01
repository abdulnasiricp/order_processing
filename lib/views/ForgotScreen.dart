// ignore_for_file: file_names, sized_box_for_whitespace, avoid_print

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:order_processing/views/loginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  TextEditingController forgotPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
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
                height: 30,
              ),
              FadeInLeft(
                duration: const Duration(milliseconds: 1800),
                child: TextFormField(
                  controller: forgotPasswordController,
                  decoration: InputDecoration(
                    hintText: 'Forgot Password',
                    labelText: 'Forgot Password',
                    prefixIcon: const Icon(Icons.password),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              FadeInUp(
                duration: const Duration(milliseconds: 1500),
                child:
                    ElevatedButton(onPressed: () async{
                      var forgotEmail=forgotPasswordController.text.trim();
                      EasyLoading.show();
                      try {
                        await  FirebaseAuth
                                    .instance.sendPasswordResetEmail(email:forgotEmail).then((value)=>{
                          print('Email Send'),
                          Get.to(()=>const LoginScreen()),
                              EasyLoading.dismiss(),

                        });
                        
                      } on FirebaseException catch (e) {
                        print('Error $e');
                              EasyLoading.dismiss();

                        
                      }
                    }, child: const Text('Forgot')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
