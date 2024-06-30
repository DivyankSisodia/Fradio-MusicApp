import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/snackbar.dart';
import '../services/user_info.dart';

class LoginWithEmail {

  final _auth = FirebaseAuth.instance;

  Future<UserCredential?> signIn(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showCustomSnackBar(
          context,
          'Error: ${e.toString()}',
          Colors.red,
        );
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        showCustomSnackBar(
          context,
          'Error: ${e.toString()}',
          Colors.amber.shade700,
        );
        print('Wrong password provided for that user.');
      }
      return null;
    }
  }

  Future<String?> verifyEmail(BuildContext context) async {
    final user = _auth.currentUser;
    try {
      if (user != null) {
        user.sendEmailVerification();
      }
      return null;
    } catch (e) {
      showCustomSnackBar(
        context,
        'Error: ${e.toString()}',
        Colors.amber.shade700,
      );
      return null;
    }
  }

  Future<UserCredential?> createUserAccount(
      String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      Map<String, dynamic> userData = {
        "email": userCredential.user!.email,
      };

      await DataBaseMethods().createUser(userData);

      showCustomSnackBar(
        context,
        'Account created successfully',
        Colors.green,
      );

      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showCustomSnackBar(
          context,
          'Error: ${e.toString()}',
          Colors.red,
        );
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showCustomSnackBar(
          context,
          'Error: ${e.toString()}',
          Colors.amber.shade700,
        );
        print('The account already exists for that email.');
      }
      return null;
    } catch (e) {
      showCustomSnackBar(
        context,
        'Error: ${e.toString()}',
        Colors.amber.shade700,
      );
      return null;
    }
  }
}
