import 'package:flutter/cupertino.dart';
import 'package:fradio/src/features/auth/screen/login_screen.dart';
import 'package:fradio/src/features/auth/screen/otp_screen.dart';

import '../../core/screens/error_screen.dart';
import '../../features/auth/screen/login_with_email_screen.dart';
import '../../features/auth/screen/phone_authentication.dart';
import '../../features/auth/screen/signup_screen.dart';
import '../../features/home/screen/home_screen.dart';
import '../../features/search/screen/category_playlist_screen.dart';

class Routes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SignUpScreen.routeName:
        return _cupertinoRoute(
          const SignUpScreen(),
        );
      case LoginScreen.routeName:
        return _cupertinoRoute(
          const LoginScreen(),
        );
      case EmailLoginScreen.routeName:
        return _cupertinoRoute(
          const EmailLoginScreen(),
        );
      case HomeScreen.routeName:
        return _cupertinoRoute(
          const HomeScreen(),
        );
      case PhoneAuthScreen.routeName:
        return _cupertinoRoute(
          const PhoneAuthScreen(),
        );
      case OTPScreen.routeName:
        final args = settings.arguments as String;
        return _cupertinoRoute(
          OTPScreen(verificationId: args),
        );
      case CategoryPlaylistScreen.routeName:
        final args = settings.arguments as String;
        return _cupertinoRoute(
          CategoryPlaylistScreen(playlistId: args),
        );
      default:
        return _cupertinoRoute(
          ErrorScreen(
            error: 'Wrong Route provided ${settings.name}',
          ),
        );
    }
  }

  static Route _cupertinoRoute(Widget view) => CupertinoPageRoute(
        builder: (_) => view,
      );

  Routes._();
}
