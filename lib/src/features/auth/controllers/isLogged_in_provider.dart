import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

class SignInNotifier extends StateNotifier<bool> {
  SignInNotifier() : super(false) {
    _loadSignInStatus();
  }

  Future<void> _loadSignInStatus() async {
    var box = Hive.box('authBox');
    state = box.get('isSignedIn', defaultValue: false);
  }

  Future<void> setSignInStatus(bool isSignedIn) async {
    var box = Hive.box('authBox');
    await box.put('isSignedIn', isSignedIn);
    state = isSignedIn;
  }
}

final signInProvider = StateNotifierProvider<SignInNotifier, bool>((ref) {
  return SignInNotifier();
});
