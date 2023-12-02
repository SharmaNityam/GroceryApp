import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //logo
        Padding(
          padding: const EdgeInsets.only(
            left:10.0, right: 10.0, bottom: 10.0, top: 10),
          child: Image.asset('lib/Images/avocado.png'),
        ),

          //we deliever groceries to your doorstep
           Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "We deliever quality groceries at your doorstep",
            textAlign: TextAlign.center,
            style: GoogleFonts.notoSerif(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            ),
            ),
          
          const SizedBox(height: 24),
           //fresh items everyday
           Text(
            "Fresh groceries everyday",
            style: TextStyle(color: Colors.grey[600]),
          ),

          const Spacer(),
          
          //get started button
           GestureDetector(
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
              return const HomePage();
            },
            ),
            ),
             child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(24),
              child: const Text("Dive in now",
              style: TextStyle(color: Colors.white),
              ),
                     ),
           ),

          const Spacer(),

        ],
      ),
    );
  }
}