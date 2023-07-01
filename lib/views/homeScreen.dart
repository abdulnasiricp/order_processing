// ignore_for_file: avoid_unnecessary_containers, file_names, unnecessary_null_comparison

import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:order_processing/utils/constant.dart';
import 'package:order_processing/views/CreateNewOrderScreen.dart';
import 'package:order_processing/views/loginScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstant.appName),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: () {
                Get.to(() => const CreateNewOrderScreen());
              },
              child: const CircleAvatar(
                child: Icon(Icons.add_business),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(children: [
          const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(child: Text('AN')),
              accountName: Text('Abdul Nasir'),
              accountEmail: Text('abdulnasiricp@gmail.com')),
          const ListTile(
            title: Text('Home'),
            leading: Icon(Icons.home),
            trailing: Icon(Icons.arrow_forward),
          ),
          const ListTile(
            title: Text('Add New Order'),
            leading: Icon(Icons.business),
            trailing: Icon(Icons.arrow_forward),
          ),
          const ListTile(
            title: Text('About'),
            leading: Icon(Icons.info),
            trailing: Icon(Icons.arrow_forward),
          ),
          const Divider(
            height: 10,
            color: Colors.grey,
          ),
          const ListTile(
            title: Text('Help'),
            leading: Icon(Icons.help),
            trailing: Icon(Icons.arrow_forward),
          ),
          const Divider(
            height: 10,
            color: Colors.grey,
          ),
          ListTile(
            title: const Text('SignOut'),
            leading: const Icon(Icons.logout),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () async {
              await FirebaseAuth.instance.signOut();
              Get.offAll(() => const LoginScreen());
            },
          )
        ]),
      ),
      body: Container(
          child: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Orders')
            .where('userid', isEqualTo: user!.uid)
            .snapshots(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CupertinoActivityIndicator();
          }
          if (snapshot == null) {
            return const Center(
              child: Text('Error'),
            );
          }
          if (snapshot != null && snapshot.data != null) {
            return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  String status = snapshot.data?.docs[index]['status'];
                  var docId= snapshot.data?.docs[index].id;
                  return Card(
                    child: FadeInLeft(
                      child: ListTile(
                        title: Text(snapshot.data?.docs[index]['product name']),
                        subtitle: status == "pending"
                            ? Text(
                                snapshot.data?.docs[index]['status'],
                                style: const TextStyle(color: Colors.green),
                              )
                            : Text(
                                snapshot.data?.docs[index]['status'],
                                style: const TextStyle(color: Colors.red),
                              ),
                        leading: CircleAvatar(
                          child: Text(index.toString()),
                        ),
                        trailing: InkWell(
                          onTap: () {
                            Get.defaultDialog(
                              title: 'Do you want to change into sold',
                              content: const Text(''),
                              onCancel: (){},
                              onConfirm: ()async{
                                EasyLoading.show();

                                FirebaseFirestore.instance.collection('Orders').doc(docId).update({'status':'sold'});
                                EasyLoading.dismiss();

                                Get.back();




                              }
                            );
                           
                          },
                          child: const CircleAvatar(
                            child: Icon(Icons.edit),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }
          return Container();
        },
      )),
    );
  }
}
