import 'package:flutter/material.dart';

import 'pages/login.page.dart';

void main() {
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
      ),
      home: const LoginPage(),
    );
  }
}
