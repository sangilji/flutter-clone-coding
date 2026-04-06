import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice/screens/splash_screen.dart';
import 'package:practice/states/user_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text('HomeScreen'),
       actions: [
         IconButton(onPressed: (){
           context.read<UserProvider>().setUserAuth(false);
         }, icon: Icon(Icons.logout)),
       ],
      ));

  }


}
