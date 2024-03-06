import 'package:djm_social/utils/color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class FriendDetail extends StatefulWidget {
  final friendId;
  final friendName;
  final friendPhoto;
  FriendDetail(
      {super.key,
      required this.friendId,
      required this.friendName,
      required this.friendPhoto});

  @override
  State<FriendDetail> createState() => _FriendDetailState();
}

class _FriendDetailState extends State<FriendDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: white),
        centerTitle: true,
        backgroundColor: colorBlack,
        title: Text(
          widget.friendName,
          style: GoogleFonts.abhayaLibre(color: white),
        ),
      ),
      body: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(widget.friendPhoto),
          ),
          Text(widget.friendName),
          ElevatedButton(onPressed: () {}, child: Text("asd"))
        ],
      ),
    );
  }
}
