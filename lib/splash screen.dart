import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'main.dart';
import 'signinpage.dart';

// void main()
// {
//   runApp(const SplashScreen());
// }
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  checkUser() {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

    final documentSnapshot = firebaseFirestore.collection('mycall').get();

  }
  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 5),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_){
        return const LoginScreen();
      }));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center (
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          children:  [
            const Text('Splashing...'),
            Image.asset('image/1.jpg')
          ],
        ),
      ),
    );
  }
}
