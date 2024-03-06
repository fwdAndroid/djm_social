import 'package:djm_social/screens/chat/chat_page.dart';
import 'package:djm_social/screens/tabs/admin_chat.dart';
import 'package:djm_social/screens/tabs/find_friends.dart';
import 'package:djm_social/screens/tabs/friends.dart';
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
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        backgroundColor: colorBlack,
        appBar: AppBar(
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
          bottom: const TabBar(
            unselectedLabelStyle: TextStyle(color: white),
            labelStyle: TextStyle(color: navColor),
            tabs: <Widget>[
              Tab(
                text: "Find Friends",
              ),
              Tab(
                text: "Friends Chat",
              ),
              Tab(
                text: "Admin Chat",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [FindFriends(), Friends(), AdminChat()],
        ),
      ),
    );
  }
}
