import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: backgroundColor,
          textTheme: TextTheme(
              bodyText1: TextStyle(
                color: Colors.white,
                fontFamily: GoogleFonts.montserrat().fontFamily,
              ),
              bodyText2: const TextStyle(color: Colors.white)),
          primarySwatch: Colors.blue,
          backgroundColor: Colors.black),
      home: SplashScreen(),
    );
  }
}
