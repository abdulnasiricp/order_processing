import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:order_processing/utils/constant.dart';
import 'package:order_processing/views/homeScreen.dart';
import 'package:order_processing/views/loginScreen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: 'AIzaSyArIhHaKL245cXcmtICIdt8-rloe6UT7Mg',
        appId: '1:970336130885:android:4f26b09483eafa1174902c',
        projectId: 'order-processing-app',
        messagingSenderId: '970336130885'),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  User? user;
  @override
  void initState() {
    user=FirebaseAuth.instance.currentUser;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstant.appName,
      theme: ThemeData(
        primarySwatch: Colors.cyan
      ),
      home: user != null? const HomeScreen() :const LoginScreen(),
      builder: EasyLoading.init(),
    );
  }
}
