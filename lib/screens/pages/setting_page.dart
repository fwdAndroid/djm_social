import 'package:djm_social/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: colorBlack,
        centerTitle: true,
        title: Text(
          "Setting",
          style: GoogleFonts.caprasimo(
            fontSize: 20,
            color: white,
          ),
        ),
      ),
      body: Container(
          color: Colors.black,
          child: Column(
            children: [
              Container(
                color: Colors.black,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/Rectangle 1092.png",
                      height: 80,
                    ),
                    Text(
                      "John",
                      style: GoogleFonts.abhayaLibre(
                          color: white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "fwdkaleem@gmail.com",
                      style: GoogleFonts.abhayaLibre(
                          color: white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/Group 422.png",
                          height: 40,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          "assets/Group 423.png",
                          height: 40,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          "assets/Group 424.png",
                          height: 40,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                height: 200,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 1.821,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        subtitle: Text(
                          "Jhon Abraham",
                          style: GoogleFonts.abhayaLibre(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: colorBlack),
                        ),
                        title: Text(
                          "Display Name",
                          style: GoogleFonts.abhayaLibre(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: btnColor),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        subtitle: Text(
                          "fwdkaleem@gmail.com",
                          style: GoogleFonts.abhayaLibre(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: colorBlack),
                        ),
                        title: Text(
                          "Email Address",
                          style: GoogleFonts.abhayaLibre(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: btnColor),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        subtitle: Text(
                          "23 B Eden Garden",
                          style: GoogleFonts.abhayaLibre(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: colorBlack),
                        ),
                        title: Text(
                          "Address",
                          style: GoogleFonts.abhayaLibre(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: btnColor),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        subtitle: Text(
                          "+9224114142",
                          style: GoogleFonts.abhayaLibre(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: colorBlack),
                        ),
                        title: Text(
                          "Phone Number",
                          style: GoogleFonts.abhayaLibre(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: btnColor),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
