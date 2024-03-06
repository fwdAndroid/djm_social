import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:djm_social/screens/auth/main_login.dart';
import 'package:djm_social/services/database.dart';
import 'package:djm_social/utils/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("users")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            var snap = snapshot.data;
            return Container(
                color: Colors.black,
                child: Column(
                  children: [
                    Container(
                      color: Colors.black,
                      child: Column(
                        children: [
                          CircleAvatar(
                              radius: 40,
                              backgroundImage: NetworkImage(
                                snap['photoURL'],
                              )),
                          Text(
                            snap['name'],
                            style: GoogleFonts.abhayaLibre(
                                color: white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            snap['email'],
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
                      height: MediaQuery.of(context).size.height / 1.819,
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
                                snap['name'],
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
                                snap['email'],
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
                                snap['phoneNumber'],
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
                          ),
                          Divider(
                            color: colorBlack.withOpacity(.5),
                          ),
                          GestureDetector(
                            onTap: () async {
                              showDialog<void>(
                                context: context,
                                barrierDismissible:
                                    false, // user must tap button!
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
                                          Text(
                                              'Do you want to delete  your account'),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('Yes'),
                                        onPressed: () async {
                                          Database().deleteUserAccount();
                                          Database().deleteUserData();
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (builder) =>
                                                      MainLogin()));
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(
                                                      "Account Delete Successfully")));
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
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.delete,
                                    color: navColor,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Delete Account",
                                    style: GoogleFonts.poppins(
                                      color: colorBlack,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog<void>(
                                context: context,
                                barrierDismissible:
                                    false, // user must tap button!
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Center(
                                        child: const Text(
                                      'Logout Alert',
                                      style: TextStyle(fontSize: 20),
                                    )),
                                    content: const SingleChildScrollView(
                                      child: ListBody(
                                        children: <Widget>[
                                          Text('Do you want to logout'),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: const Text('Yes'),
                                        onPressed: () async {
                                          await FirebaseAuth.instance
                                              .signOut()
                                              .then((value) => {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (builder) =>
                                                                MainLogin())),
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            content: Text(
                                                                "Account Logout Successfully")))
                                                  });
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
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.logout,
                                    color: navColor,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Logout",
                                    style: GoogleFonts.poppins(
                                      color: colorBlack,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ));
          }),
    );
  }
}
