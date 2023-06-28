// ignore_for_file: avoid_unnecessary_containers, file_names

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order_processing/utils/constant.dart';
import 'package:order_processing/views/CreateNewOrderScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppConstant.appName),
        centerTitle: true,
        actions:  [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onTap: (){
                Get.to(()=>const CreateNewOrderScreen());
              },
              child: const CircleAvatar(
                child: Icon(Icons.add_business),
              ),
            ),
          ),
        ],
      ),
      drawer:  Drawer(
          child: ListView(
            children:const [
              UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(child: Text('AN')),
                accountName: Text('Abdul Nasir'),
                accountEmail: Text('abdulnasiricp@gmail.com')),
                ListTile(
                  title: Text('Home'),
                  leading: Icon(Icons.home),
                  trailing: Icon(Icons.arrow_forward),
                ),
                  ListTile(
                  title: Text('Add New Order'),
                  leading: Icon(Icons.business),
                  trailing: Icon(Icons.arrow_forward),
                ),
                  ListTile(
                  title: Text('About'),
                  leading: Icon(Icons.info),
                  trailing: Icon(Icons.arrow_forward),
                ),
                Divider(height: 10,color: Colors.grey,),
                  ListTile(
                  title: Text('Help'),
                  leading: Icon(Icons.help),
                  trailing: Icon(Icons.arrow_forward),
                )

            ] 
          ),
          ),
      body: Container(
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Card(
                child: FadeInLeft(
                  child: ListTile(
                    title: const Text('Order no 01'),
                    subtitle: const Text(
                      'pending',
                      style: TextStyle(color: Colors.green),
                    ),
                    leading: CircleAvatar(
                      child: Text(index.toString()),
                    ),
                    trailing: const CircleAvatar(
                      child: Icon(Icons.edit),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
