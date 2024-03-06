import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:djm_social/screens/main_dashboard.dart';
import 'package:djm_social/utils/color.dart';
import 'package:djm_social/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class FriendDetail extends StatefulWidget {
  final friendId;
  final friendName;
  final friendPhoto;
  final friendUUid;
  FriendDetail(
      {super.key,
      required this.friendId,
      required this.friendName,
      required this.friendUUid,
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(widget.friendPhoto),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.friendName,
                style: GoogleFonts.abhayaLibre(
                    fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: btnColor, fixedSize: Size(260, 50)),
                  onPressed: () async {
                    showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Center(
                              child: const Text(
                            'Delete Alert',
                            style: TextStyle(fontSize: 20),
                          )),
                          content: const SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text('Do you want to unfriend  your friend'),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: const Text('Yes'),
                              onPressed: () async {
                                await FirebaseFirestore.instance
                                    .collection("chats")
                                    .doc(widget.friendUUid)
                                    .update({"friendship": "unfriend"});

                                messageBar("You Unfriend Your Friend", context);
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) => MainDashboard()));
                              },
                            ),
                            TextButton(
                              child: const Text('No'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    "Remove as Friend",
                    style: TextStyle(color: white),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
