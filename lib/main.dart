import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_login_notification/pages/splash_screen.page.dart';
import 'package:social_login_notification/widgets/my_drawer/my_drawer.store.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GoogleSignIn.instance.initialize();
  GetIt.I.registerSingleton(MyDrawerStore());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Login with notification',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(primary: Color(0xFFf9f4ec)),
        scaffoldBackgroundColor: const Color(0xFFf9f4ec),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.black,
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.green,
        ),
        listTileTheme: const ListTileThemeData(selectedColor: Colors.blue),
      ),
      home: const SplashScreenPage(),
    );
  }
}
