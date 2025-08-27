import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoperroo/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // logo
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 40),
            child: Image.asset('lib/images/sandwich.png'),
          ),

          // text
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "We deliver groceries at your doorstep",
              style: GoogleFonts.notoSerif(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          Text(
            "Fresh items everyday",
            style: GoogleFonts.notoSans(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),

          // button
          GestureDetector(
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const HomePage();
                },
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.green[600],
                  borderRadius: BorderRadius.circular(12)),
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              child: Text(
                "Get Started!",
                style: GoogleFonts.notoSans(fontSize: 16, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
