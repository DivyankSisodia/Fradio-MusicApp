import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fradio/main.dart';
import 'package:fradio/src/features/home/screen/home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../services/user_info.dart';

class GoogleSignMethod {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? getCurrentUser() {
    return _auth.currentUser;
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      // Initiate the Google sign-in process
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount == null) {
        // The user canceled the sign-in
        return;
      }

      // Get the authentication tokens
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      // Ensure the tokens are not null
      if (googleSignInAuthentication.idToken == null ||
          googleSignInAuthentication.accessToken == null) {
        throw Exception('Failed to obtain authentication tokens');
      }

      // Create a credential from the tokens
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      // Sign in with the credential
      UserCredential userCreds = await _auth.signInWithCredential(credential);

      User? userDetails = userCreds.user;

      if (userDetails != null) {
        Map<String, dynamic> userData = {
          "name": userDetails.displayName,
          "email": userDetails.email,
          "photoUrl": userDetails.photoURL,
          "phoneNumber": userDetails.phoneNumber,
          "uid": userDetails.uid,
        };

        bool result =
            await DataBaseMethods().addUser(userDetails.uid, userData);

            print('User added to the database: $result');

        if (result) {
          var box = Hive.box('authBox');
          box.put('isSignedIn', true);
          Navigator.of(context).pushNamed(MainScreen.routeName);
        } else {
          print('Failed to add user to the database');
        }
      }
    } catch (e) {
      // Handle error (e.g., show a message to the user)
      print('Error signing in with Google: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error signing in with Google: $e')),
      );
    }
  }
}
