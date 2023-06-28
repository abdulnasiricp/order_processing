// ignore_for_file: avoid_unnecessary_containers, file_names

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:order_processing/utils/constant.dart';

class CreateNewOrderScreen extends StatefulWidget {
  const CreateNewOrderScreen({super.key});

  @override
  State<CreateNewOrderScreen> createState() => _CreateNewOrderScreenState();
}

class _CreateNewOrderScreenState extends State<CreateNewOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstant.appName),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
               const SizedBox(
                      height: 20,
                    ),
                 FadeInLeft(
                      duration: const Duration(milliseconds: 1800),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Product Name',
                          labelText: 'Product Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                       FadeInLeft(
                      duration: const Duration(milliseconds: 1800),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Client Name',
                          labelText: 'Client Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                       FadeInLeft(
                      duration: const Duration(milliseconds: 1800),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Client Address',
                          labelText: 'Client Address',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                       FadeInLeft(
                      duration: const Duration(milliseconds: 1800),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Client Mobile No.',
                          labelText: 'Client Mobile No.',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                       FadeInLeft(
                      duration: const Duration(milliseconds: 1800),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Buy Price',
                          labelText: 'Buy Price',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                       FadeInLeft(
                      duration: const Duration(milliseconds: 1800),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Sale Price',
                          labelText: 'Sale Price',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                       FadeInLeft(
                      duration: const Duration(milliseconds: 1800),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Sale Date',
                          labelText: 'Sale Date',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(onPressed: (){},child: const Text('Create Order'),)
            ],
          ),
        ),
      ),
    );
  }
}