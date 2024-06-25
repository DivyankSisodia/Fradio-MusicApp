import 'package:flutter/material.dart';
import 'package:fradio/src/features/auth/screen/login_screen.dart';
import 'package:fradio/src/features/auth/screen/signup_screen.dart';
import 'package:go_router/go_router.dart';

class MyAppRoutes {
  GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: 'home',
        path: '/',
        pageBuilder: (context, state) {
          return const MaterialPage(child: SignupScreen());
        },
      ),
      GoRoute(
        name: 'login',
        path: '/login',
        pageBuilder: (context, state) {
          return const MaterialPage(child: LoginScreen());
        },
      ),
    ],
  );
}
