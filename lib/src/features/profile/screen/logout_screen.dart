import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../auth/screen/signup_screen.dart';

class LogOutScreen extends StatelessWidget {

  const LogOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              var box = Hive.box('authBox');
              box.put('isSignedIn', false); // Update the auth status
              Navigator.of(context).pushNamed(LoginScreen.routeName);
            },
            child: const Text('Sign Out'),
          ),
        ),
      ),
    );
  }
}
