
import 'package:flutter/material.dart';

import 'auth.dart';
import 'home.dart';
import 'login.dart';

class Redirection extends StatefulWidget {
  const Redirection({super.key});

  @override
  State<Redirection> createState() => _RedirectionState();
}

class _RedirectionState extends State<Redirection> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: Auth().authStatechanges,
        builder: (context,snaphsot){
          if(snaphsot.connectionState == ConnectionState.waiting){
            return const CircularProgressIndicator();
          }else
          if(snaphsot.hasData){
            return const Homepage(title:"My Home Page");
          }else{
            return const Login(title: "Login page");
          }
        }
    );
  }
}

