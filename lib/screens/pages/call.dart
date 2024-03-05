import 'package:djm_social/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CallPage extends StatefulWidget {
  const CallPage({super.key});

  @override
  State<CallPage> createState() => _CallPageState();
}

class _CallPageState extends State<CallPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBlack,
      appBar: AppBar(
        leading: Icon(
          Icons.search,
          color: white,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: colorBlack,
        centerTitle: true,
        title: Text(
          "Call Page",
          style: GoogleFonts.caprasimo(
            fontSize: 20,
            color: white,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40))),
        child: ListView.builder(itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
                leading: Image.asset("assets/logo.png"),
                title: Text(
                  "Alex Linderson",
                  style: GoogleFonts.abhayaLibre(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "2 min ago",
                  style: GoogleFonts.abhayaLibre(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: btnColor),
                ),
                trailing: Icon(
                  Icons.call,
                  color: navColor,
                )),
          );
        }),
      ),
    );
  }
}
