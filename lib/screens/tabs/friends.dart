import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:djm_social/screens/chat/chat_page.dart';
import 'package:djm_social/utils/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Friends extends StatefulWidget {
  const Friends({super.key});

  @override
  State<Friends> createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("chats")
              .where("userId",
                  isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              // .where("friendship", isEqualTo: "unfriend")
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
                      trailing: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("chats")
                              .snapshots(),
                          builder: (context, snapshot) {
                            final List<DocumentSnapshot> documents =
                                snapshot.data!.docs;
                            final Map<String, dynamic> datas =
                                documents[index].data() as Map<String, dynamic>;
                            return TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => ChatPage(
                                              friendId: data['friendId'],
                                              friendName: data['friendName'],
                                              friendPhoto: data['friendPhoto'],
                                              userId: datas['userId'],
                                              userPhoto: datas['userPhoto'],
                                              userName: datas['userName'])));
                                },
                                child: Text("Chat Now"));
                          }),
                    ),
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
