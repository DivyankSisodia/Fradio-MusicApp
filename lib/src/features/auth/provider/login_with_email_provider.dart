import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repository/login_repository.dart';

final emailAuthProvider = Provider<LoginWithEmail>((ref) {
  return LoginWithEmail();
});
