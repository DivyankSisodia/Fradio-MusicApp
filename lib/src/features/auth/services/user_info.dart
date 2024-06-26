import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class DataBaseMethods {
  Future<bool> addUser(String userId, Map<String, dynamic> userInfo) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .set(userInfo);
      return true; // User successfully added
    } catch (e) {
      if (kDebugMode) {
        print('Error adding user to the database: $e');
      }
      return false; // Failed to add user
    }
  }

  Future<bool> createUser( Map<String, dynamic> userInfo) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(userInfo);
      return true; // User successfully added
    } catch (e) {
      if (kDebugMode) {
        print('Error adding user to the database: $e');
      }
      return false; // Failed to add user
    }
  }
}
