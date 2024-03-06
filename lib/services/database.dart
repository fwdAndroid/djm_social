import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Database {
  //Delete Account
  Future<void> deleteUserAccount() async {
    try {
      // Get the currently signed-in user
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Delete the user account
        await user.delete();

        print("User account deleted successfully");
      } else {
        print("No user signed in");
      }
    } catch (error) {
      print("Error deleting user account: $error");
    }
  }

  Future<void> deleteUserData() async {
    try {
      // Get the currently signed-in user's UID
      String? uid = FirebaseAuth.instance.currentUser?.uid;

      if (uid != null) {
        // Delete the user's document in the "users" collection
        await FirebaseFirestore.instance.collection('users').doc(uid).delete();

        print("User data deleted successfully");
      } else {
        print("No user signed in");
      }
    } catch (error) {
      print("Error deleting user data: $error");
    }
  }
}
