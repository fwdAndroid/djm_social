import 'package:djm_social/screens/auth/main_login.dart';
import 'package:djm_social/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Align(
        alignment: AlignmentDirectional.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo.png",
              width: 357,
              height: 267,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Make Chat easy with the people like you",
                style: GoogleFonts.lato(
                    color: white, fontWeight: FontWeight.bold, fontSize: 28),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Interact with people with the same\n interest like you",
                style: GoogleFonts.lato(color: white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => MainLogin()));
                },
                child: Text(
                  "Sign In",
                  style: TextStyle(color: white),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: btnColor, fixedSize: Size(300, 60)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
