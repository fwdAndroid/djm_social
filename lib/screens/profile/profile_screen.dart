import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:djm_social/screens/main_dashboard.dart';
import 'package:djm_social/services/storage.dart';
import 'package:djm_social/utils/color.dart';
import 'package:djm_social/utils/image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Uint8List? _file;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Profile",
          style: GoogleFonts.poppins(color: white),
        ),
        backgroundColor: colorBlack,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  _selectImage();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: _file != null
                          ? CircleAvatar(
                              radius: 59, backgroundImage: MemoryImage(_file!))
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/add.png",
                                width: 20,
                                height: 120,
                              ),
                            ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      labelText: 'User Name',
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: colorBlack,
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: colorBlack,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: colorBlack,
                          ))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _phoneController,
                  decoration: InputDecoration(
                      labelText: 'Phone Number',
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: colorBlack,
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: colorBlack,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: colorBlack,
                          ))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: colorBlack,
                          )),
                      errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: colorBlack,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          borderSide: BorderSide(
                            color: colorBlack,
                          ))),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: _isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Center(
                        child: _isLoading
                            ? Center(child: CircularProgressIndicator())
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: btnColor,
                                    fixedSize: Size(300, 50),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30))),
                                onPressed: () async {
                                  if (_file == null) {
                                    messageBar("Image is Required", context);
                                  } else if (_nameController.text.isEmpty) {
                                    messageBar(
                                        "User Name is Required", context);
                                  } else if (_emailController.text.isEmpty) {
                                    messageBar("Email is Required", context);
                                  } else if (_phoneController.text.isEmpty) {
                                    messageBar(
                                        "Phone Number is Required", context);
                                  } else {
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    String photoURL = await StorageMethods()
                                        .uploadImageToStorage(
                                            'ProfilePics', _file!, false);
                                    await FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(FirebaseAuth
                                            .instance.currentUser!.uid)
                                        .set({
                                      "uid": FirebaseAuth
                                          .instance.currentUser!.uid,
                                      "phoneNumber": FirebaseAuth.instance
                                              .currentUser!.phoneNumber ??
                                          _phoneController.text,
                                      "email": FirebaseAuth
                                              .instance.currentUser!.email ??
                                          _emailController.text,
                                      "name": FirebaseAuth.instance.currentUser!
                                              .displayName ??
                                          _nameController.text,
                                      "photoURL": photoURL,

                                      // "photoURL": photoURL ?? widget.photo
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) =>
                                                MainDashboard()));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text("Profile Created")));
                                    setState(() {
                                      _isLoading = false;
                                    });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (builder) =>
                                                MainDashboard()));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content: Text("Profile Created")));
                                  }
                                },
                                child: Text(
                                  "Create Profile",
                                  style: TextStyle(color: white),
                                )),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }

//Functions
  /// Select Image From Gallery
  _selectImage() async {
    Uint8List ui = await pickImage(ImageSource.gallery);
    setState(() {
      _file = ui;
    });
  }
}
