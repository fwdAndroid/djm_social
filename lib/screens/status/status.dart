import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:djm_social/screens/main_dashboard.dart';
import 'package:djm_social/screens/profile/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CheckStatus extends StatefulWidget {
  const CheckStatus({super.key});

  @override
  State<CheckStatus> createState() => _CheckStatusState();
}

class _CheckStatusState extends State<CheckStatus> {
  @override
  void initState() {
    // TODO: implement initState
    checkresult();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Loading Please wait"),
      ),
    );
  }

  void checkresult() async {
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    final bool doesDocExist = doc.exists;

    if (doesDocExist) {
      print("wrong which");
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => MainDashboard()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (builder) => ProfileScreen()));
    }
  }
}
