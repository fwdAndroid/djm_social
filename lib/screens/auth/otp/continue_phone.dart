import 'package:country_code_picker/country_code_picker.dart';
import 'package:djm_social/screens/auth/otp/verify_phone.dart';
import 'package:djm_social/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class ContinuePhone extends StatefulWidget {
  const ContinuePhone({Key? key}) : super(key: key);

  @override
  State<ContinuePhone> createState() => _ContinuePhoneState();
}

class _ContinuePhoneState extends State<ContinuePhone> {
  final formKey = GlobalKey<FormState>();

  String dialCodeDigits = "+66";
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorBlack,
        body: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/logo.png",
                width: 150,
                height: 200,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "OTP Verification",
                style: TextStyle(
                    color: white, fontWeight: FontWeight.bold, fontSize: 25),
              ),
              const SizedBox(
                height: 6,
              ),
              const Text(
                "We will send you a code for verification dont share \n anyone your code",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: white, fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white70),
                margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Row(
                  children: [
                    CountryCodePicker(
                        onChanged: (country) {
                          setState(() {
                            dialCodeDigits = country.dialCode!;
                          });
                        },
                        initialSelection: "TH",
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        favorite: const ["+66", "TH"]),
                    Expanded(
                      child: Container(
                        child: TextFormField(
                          validator: RequiredValidator(errorText: "Required"),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "12345678",
                            //  prefix: Padding(padding: EdgeInsets.all(10),child: Text(dialCodeDigits,style: TextStyle(color: Colors.black),),),
                          ),
                          keyboardType: TextInputType.number,
                          controller: _controller,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => VerifyPhone(
                                    phone: _controller.text,
                                    codeDigits: dialCodeDigits)));
                      }
                    },
                    child: Text(
                      'Get OTP',
                      style: TextStyle(color: colorBlack),
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        fixedSize: const Size(300, 46))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
