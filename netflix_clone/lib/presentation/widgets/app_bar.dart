import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/constnts.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
              fontFamily: GoogleFonts.montserrat().fontFamily),
        ),
        Spacer(),
        Icon(
          Icons.cast,
          color: Colors.white,
        ),
        kWdith,
        Container(
          width: 30,
          height: 30,
          color: Colors.blue,
        )
      ],
    );
  }
}
