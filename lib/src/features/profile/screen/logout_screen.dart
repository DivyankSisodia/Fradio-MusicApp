import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../auth/screen/signup_screen.dart';

class LogOutScreen extends StatelessWidget {

  const LogOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () async{
              FirebaseAuth.instance.signOut();
              var box = Hive.box('authBox');
              box.put('isSignedIn', false); // Update the auth status
              Navigator.of(context).pushNamed(LoginScreen.routeName);

              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.clear();
            },
            child: const Text('Sign Out'),
          ),
        ),
      ),
    );
  }
}
