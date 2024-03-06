import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:djm_social/screens/chat/chat_page.dart';
import 'package:djm_social/utils/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';

class FindFriends extends StatefulWidget {
  const FindFriends({super.key});

  @override
  State<FindFriends> createState() => _FindFriendsState();
}

class _FindFriendsState extends State<FindFriends> {
  var uuid = Uuid().v4();
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
              .collection("users")
              .where("uid",
                  isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
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
                        backgroundImage: NetworkImage(data['photoURL']),
                      ),
                      title: Text(
                        data['name'],
                        style: GoogleFonts.abhayaLibre(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection("users")
                              .where("uid",
                                  isEqualTo:
                                      FirebaseAuth.instance.currentUser!.uid)
                              .snapshots(),
                          builder: (context, snapshot) {
                            final List<DocumentSnapshot> documents =
                                snapshot.data!.docs;
                            final Map<String, dynamic> datas =
                                documents[index].data() as Map<String, dynamic>;

                            return TextButton(
                                onPressed: () async {
                                  await FirebaseFirestore.instance
                                      .collection("chats")
                                      .doc(uuid)
                                      .set({
                                    "userPhoto": datas['photoURL'],
                                    "friendPhoto": data['photoURL'],
                                    "friendId": data['uid'],
                                    "friendName": data['name'],
                                    "userId":
                                        FirebaseAuth.instance.currentUser!.uid,
                                    "userName": datas['name'],
                                    "uuid": uuid,
                                    "friendship": "accepted"
                                  });

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (builder) => ChatPage(
                                        userPhoto: datas['photoURL'],
                                        friendPhoto: data['photoURL'],
                                        friendId: data['uid'],
                                        friendName: data['name'],
                                        userId: FirebaseAuth
                                            .instance.currentUser!.uid,
                                        userName: datas['name'],
                                      ),
                                    ),
                                  );
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
