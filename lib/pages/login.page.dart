import 'package:flutter/material.dart';
import 'package:social_login_notification/pages/login/widgets/login_button.widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Create an account or sign in to save and see your conversation history.",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: MediaQuery.of(context).size.height * .1),

              LoginButton(
                pathImage: "assets/images/google.png",
                text: "Continue with Google",
                onPressed: () {},
              ),

              SizedBox(height: 15),

              LoginButton(
                pathImage: "assets/images/facebook.png",
                text: "Continue with Facebook",
                onPressed: () {},
              ),

              SizedBox(height: 15),

              LoginButton(
                pathImage: "assets/images/apple.png",
                text: "Continue with Apple",
                onPressed: () {},
              ),

              SizedBox(height: 32),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text("or"),
                  ),
                  Expanded(child: Divider(thickness: 1, color: Colors.grey)),
                ],
              ),

              SizedBox(height: 32),

              LoginButton(
                icon: Icons.phone_iphone,
                text: "Use phone number",
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
