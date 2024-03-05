import 'package:djm_social/screens/chat/chat_page.dart';
import 'package:djm_social/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
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
          "Home",
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
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => ChatPage()));
              },
              leading: Image.asset("assets/logo.png"),
              title: Text(
                "Alex Linderson",
                style: GoogleFonts.abhayaLibre(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                "How are you today?",
                style: GoogleFonts.abhayaLibre(
                    fontSize: 12, fontWeight: FontWeight.bold, color: btnColor),
              ),
              trailing: Text(
                "2 min",
                style: GoogleFonts.abhayaLibre(
                    fontSize: 12, fontWeight: FontWeight.bold, color: btnColor),
              ),
            ),
          );
        }),
      ),
    );
  }
}
