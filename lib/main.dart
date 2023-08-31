import 'package:ecommerce/screens/bottombar.dart';
import 'package:ecommerce/screens/home.dart';
import 'package:ecommerce/screens/profile.dart';
import 'package:ecommerce/screens/signup.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static const String _title = 'Flutter Stateful Clicker Counter';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          bodyText1: TextStyle(
            fontFamily: 'Metropolis',
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xffF6F6F6),
          ),
          bodyText2: TextStyle(
            fontFamily: 'Metropolis',
            fontSize: 14,
            color: Color(0xffABB4BD),
          ),
          headline4: TextStyle(
            fontFamily: 'Metropolis',
            fontSize: 34,
            fontWeight: FontWeight.w700,
            color: Color(0xffF6F6F6),
          ),
          headline3: TextStyle(
            fontFamily: 'Metropolis',
            fontSize: 34,
            fontWeight: FontWeight.w700,
            color: Color(0xffF6F6F6),
          ),
        ),
      ),
      home: esignup(),
    );
  }
}
