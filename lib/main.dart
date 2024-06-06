// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:pts2024/ui/home.dart';
import 'package:pts2024/ui/homePage.dart';
import 'package:pts2024/ui/productDetail.dart';
import 'package:pts2024/ui/splashscreen.dart';

Future main() async{
    await dotenv.load(fileName: ".env");
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 3)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              initialRoute: '/',
              routes: {
                '/': (context) => Home(),
                '/splash': (context) => SplashScreen(),
                '/detail' : (context) => ProductDetail()
              },
            );
          }

          return SplashScreen();
        });
  }
}