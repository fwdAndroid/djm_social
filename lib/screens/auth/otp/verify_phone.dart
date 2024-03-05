import 'package:djm_social/screens/main_dashboard.dart';
import 'package:djm_social/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyPhone extends StatefulWidget {
  final String phone;
  final String codeDigits;
  VerifyPhone({required this.phone, required this.codeDigits});

  @override
  State<VerifyPhone> createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  final TextEditingController controllerpin = TextEditingController();
  final FocusNode pinVerifyPhonePFocusNode = FocusNode();

  String? verificationCode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verificationPhone();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorBlack,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              height: 100,
              width: 200,
            ),
            const SizedBox(
              height: 30,
            ),
            InkWell(
              child: Text(
                "verification: ${widget.codeDigits}-${widget.phone}",
                style: TextStyle(color: white),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 20, top: 20),
              child: PinCodeTextField(
                appContext: context,
                length: 6,
                focusNode: pinVerifyPhonePFocusNode,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: white,
                ),
                cursorColor: white,
                controller: controllerpin,
                pastedTextStyle: TextStyle(
                  color: Colors.green.shade600,
                  fontWeight: FontWeight.bold,
                ),
                onCompleted: (pin) async {
                  try {} catch (e) {
                    FocusScope.of(context).unfocus();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Invalid Code"),
                      duration: Duration(seconds: 12),
                    ));
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: const Text(
                'Please enter the 6-digit code \n  sent to your number',
                style: TextStyle(color: white),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              child: Text("Continue"),
              onPressed: (() {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (builder) => MainDashboard()));
              }),
            )
          ],
        ),
      ),
    );
  }

  void verificationPhone() async {}

  // void addPhone() async {
  //   await DatabaseMethods().phone();
  //   // .then((value) => Customdialog.closeDialog(context));
  // }
}
