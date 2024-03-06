import 'package:djm_social/screens/auth/otp/continue_phone.dart';
import 'package:djm_social/screens/profile/profile_screen.dart';
import 'package:djm_social/screens/status/status.dart';
import 'package:djm_social/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainLogin extends StatefulWidget {
  const MainLogin({super.key});

  @override
  State<MainLogin> createState() => _MainLoginState();
}

class _MainLoginState extends State<MainLogin> {
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
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                await AuthMethods().signInWithGoogle().then((value) => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => CheckStatus()))
                    });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/goog.png",
                  width: 357,
                  height: 50,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => ContinuePhone()));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/phone.png",
                  width: 357,
                  height: 50,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
