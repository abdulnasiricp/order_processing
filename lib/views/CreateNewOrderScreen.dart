// ignore_for_file: avoid_unnecessary_containers, file_names

import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:order_processing/utils/constant.dart';
import 'package:order_processing/views/homeScreen.dart';

class CreateNewOrderScreen extends StatefulWidget {
  const CreateNewOrderScreen({super.key});

  @override
  State<CreateNewOrderScreen> createState() => _CreateNewOrderScreenState();
}

class _CreateNewOrderScreenState extends State<CreateNewOrderScreen> {

  User? user =FirebaseAuth.instance.currentUser;
  TextEditingController productNameController = TextEditingController();
  TextEditingController customerNameController = TextEditingController();
  TextEditingController customerAddressController = TextEditingController();
  TextEditingController customerMobilenoController = TextEditingController();
  TextEditingController buyPriceController = TextEditingController();
  TextEditingController salePriceController = TextEditingController();
  TextEditingController saleDateController = TextEditingController();
  
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
                        controller: productNameController,
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
                        controller: customerNameController,
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
                        controller: customerAddressController,
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
                        controller: customerMobilenoController,
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
                        controller: buyPriceController,
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
                        controller: salePriceController,
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
                        controller: saleDateController,
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
                    ElevatedButton(onPressed: ()async{
                      EasyLoading.show();
                      var profit = int.parse(salePriceController.text)-int.parse(buyPriceController.text);

                      Map<String, dynamic> userOrderMap ={
                      'userid':user?.uid,
                      'product name': productNameController.text.trim(),
                      'customer name': customerNameController.text.trim(),
                      'customer address': customerAddressController.text.trim(),
                      'customer mobile': customerMobilenoController.text.trim(),
                      'buy price': buyPriceController.text.trim(),
                      'sale price': salePriceController.text.trim(),
                      'sale date': saleDateController.text.trim(),
                      'createAt': DateTime.now(),
                      'profit': profit,
                      'status': "pending"


                      };
                      await FirebaseFirestore.instance.collection('Orders').doc().set(
                        userOrderMap,
                      );
                        Get.off(()=>const HomeScreen());
                        EasyLoading.dismiss();


                    },child: const Text('Create Order'),)
            ],
          ),
        ),
      ),
    );
  }
}