import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
part 'login.store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  static Future<void>? _googleSignInInitialization;

  @observable
  bool isFacebookLoading = false;

  @observable
  bool isGoogleLoading = false;

  @action
  Future<UserCredential> signInWithGoogle() async {
    isGoogleLoading = true;

    try {
      final googleSignIn = GoogleSignIn.instance;

      _googleSignInInitialization ??= googleSignIn.initialize();
      await _googleSignInInitialization;

      if (!googleSignIn.supportsAuthenticate()) {
        throw UnsupportedError(
          'Google sign-in is not supported by this platform flow',
        );
      }

      // Trigger the authentication flow.
      final GoogleSignInAccount googleUser = await googleSignIn.authenticate();

      // Obtain the auth details from the request.
      final GoogleSignInAuthentication googleAuth =
          googleUser.authentication;

      // google_sign_in 7.x exposes the ID token in authentication.
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential.
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } finally {
      isGoogleLoading = false;
    }
  }

  @action
  Future<UserCredential> signInWithFacebook() async {
    isFacebookLoading = true;

    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Ensure the login was successful
      if (loginResult.status != LoginStatus.success ||
          loginResult.accessToken == null) {
        throw Exception('Facebook sign-in failed or was cancelled');
      }

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

      // Once signed in, return the UserCredential
      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } finally {
      isFacebookLoading = false;
    }
  }
}
