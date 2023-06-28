// ignore_for_file: file_names, sized_box_for_whitespace

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
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
                  const SizedBox(height: 30,),
              FadeInLeft(
                duration: const Duration(milliseconds: 1800),
                child: TextFormField(
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
                child: ElevatedButton(onPressed: () {}, child: const Text('Send')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
