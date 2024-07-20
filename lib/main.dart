import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fradio/hive.dart';
import 'package:fradio/src/features/auth/screen/signup_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'firebase_options.dart';
import 'src/config/routes/app_routes.dart';
import 'src/features/auth/controllers/isLogged_in_provider.dart';
import 'src/features/home/screen/home_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Load .env file
  await dotenv.load(fileName: ".env");

  // Initialize Hive
  await Hive.initFlutter();
  // Register Hive Adaptors
  hiveAdaptors();

  // Open Hive Box for authentications
  await Hive.openBox('authBox');

  runApp(
    ProviderScope(
      child: ScreenUtilInit(
        designSize: const Size(475, 912),
        builder: (context, _) {
          return const MyApp();
        },
      ),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSignedIn = ref.watch(signInProvider);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isSignedIn ? const HomeScreen() : const LoginScreen(),
      onGenerateRoute: (RouteSettings settings) =>
          Routes.onGenerateRoute(settings),
    );
  }
}
