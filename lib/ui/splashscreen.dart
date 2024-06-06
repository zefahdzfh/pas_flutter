// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.9,
                child: Center(child: Text('ze-shoppe',style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 55,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2.0,
                  )
                ),))),
            Center(
              child: Text("Version 1.0 Demo"),
            )
          ],
        ),
      ),
    );
  }
}