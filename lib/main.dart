import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:is_takip_flutter/screens/customers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:is_takip_flutter/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(is_takip());

}

class is_takip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //  accentColor: Colors.orangeAccent,
      ),
      routes: {
        "/": (BuildContext context) => LoginScreen(),
      },
    );
  }
}
