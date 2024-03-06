import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:djm_social/screens/detail/friend_detail.dart';
import 'package:djm_social/utils/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
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
          "Contact Page",
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
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("chats")
              .where("userId",
                  isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .where("friendship", isNotEqualTo: "unfriend")
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text(
                  "No Friend Found yet",
                  style: TextStyle(color: Colors.black),
                ),
              );
            }
            final List<DocumentSnapshot> documents = snapshot.data!.docs;

            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (context, index) {
                final Map<String, dynamic> data =
                    documents[index].data() as Map<String, dynamic>;

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(data['friendPhoto']),
                        ),
                        title: Text(
                          data['friendName'],
                          style: GoogleFonts.abhayaLibre(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (builder) => FriendDetail(
                                            friendId: data['friendId'],
                                            friendName: data['friendName'],
                                            friendPhoto: data['friendPhoto'],
                                          )));
                            },
                            child: Text("Chat Now"))),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
