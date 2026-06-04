import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:social_login_notification/pages/login.page.dart';
import 'package:social_login_notification/pages/splash_screen.page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (FirebaseAuth.instance.currentUser!.photoURL != null)
              CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage(
                  FirebaseAuth.instance.currentUser!.photoURL!,
                ),
              ),
            SizedBox(height: 16),
            if (FirebaseAuth.instance.currentUser!.displayName != null)
              Text(FirebaseAuth.instance.currentUser!.displayName!),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut();

                if (!context.mounted) return;

                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Text("Sign out"),
            ),
          ],
        ),
      ),
    );
  }
}
