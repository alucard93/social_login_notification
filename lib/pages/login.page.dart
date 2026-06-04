import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:social_login_notification/pages/login/widgets/login.store.dart';
import 'package:social_login_notification/pages/login/widgets/login_button.widget.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_login_notification/pages/profile.page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginStore = LoginStore();

  void _navigateToProfile() {
    if (!context.mounted) return;

    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (context) => ProfilePage()));
  }

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

              Observer(
                builder: (context) {
                  return LoginButton(
                    isLoading: loginStore.isGoogleLoading,
                    pathImage: "assets/images/google.png",
                    text: "Continue with Google",
                    onPressed: () async {
                      try {
                        await loginStore.signInWithGoogle();
                      } on GoogleSignInException catch (error) {
                        if (!context.mounted) return;

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(_googleSignInErrorMessage(error)),
                          ),
                        );
                        return;
                      } on FirebaseAuthException catch (error) {
                        if (!context.mounted) return;

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(error.message ?? error.code)),
                        );
                        return;
                      }

                      _navigateToProfile();
                    },
                  );
                },
              ),

              SizedBox(height: 15),

              Observer(
                builder: (context) {
                  return LoginButton(
                    isLoading: loginStore.isFacebookLoading,
                    pathImage: "assets/images/facebook.png",
                    text: "Continue with Facebook",
                    onPressed: () async {
                      await loginStore.signInWithFacebook();

                      _navigateToProfile();
                    },
                  );
                },
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

  String _googleSignInErrorMessage(GoogleSignInException error) {
    if (error.code == GoogleSignInExceptionCode.providerConfigurationError) {
      return 'Atualize o Google Play Services do emulador ou use um emulador com Google Play.';
    }

    return error.description ?? error.code.name;
  }
}
