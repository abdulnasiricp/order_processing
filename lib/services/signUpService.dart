// ignore_for_file: file_names, non_constant_identifier_names, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:order_processing/views/loginScreen.dart';

SignUpUser(
  String userName,
  String userEmail,
  String userPassword,
) async {
  User? userid = FirebaseAuth.instance.currentUser;

  try {
    await FirebaseFirestore.instance.collection('users').doc(userid!.uid).set({
      'userEmail': userEmail,
      'userName': userName,
      'createdAt': DateTime.now(),
      'userid': userid.uid,
    }).then((value) => {
          FirebaseAuth.instance.signOut(),
          Get.to(() => const LoginScreen()),
          EasyLoading.dismiss(),
        });
  } on FirebaseAuthException catch (e) {
    print('Error $e');
    EasyLoading.dismiss();
  }
}
