import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:food_delivery_app/core/errors/exception.dart';
import 'package:food_delivery_app/features/auth/domain/entities/user_entity.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';

class FirebaseAuthServices {
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'The account already exists for that email.');
      } else {
        throw CustomException(message: 'There an error, try again later');
      }
    } catch (e) {
      throw CustomException(message: 'There an error, try again later');
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException(
          message: 'No user found for that email.',
        );
      } else if (e.code == 'wrong-password' || e.code == 'invalid-credential') {
        throw CustomException(
          message: 'Incorrect email or password.',
        );
      } else if (e.code == 'invalid-email') {
        throw CustomException(
          message: 'Please enter a valid email.',
        );
      } else if (e.code == 'user-disabled') {
        throw CustomException(
          message: 'This account has been disabled.',
        );
      } else {
        throw CustomException(
          message: 'There was an error, please try again later.',
        );
      }
    } catch (e) {
      throw CustomException(
        message: 'There was an error, please try again later.',
      );
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn.instance.authenticate();

    final GoogleSignInAuthentication? googleAuth = googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(idToken: googleAuth?.idToken);

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<void> requestTrackingPermission() async {
    final status = await AppTrackingTransparency.trackingAuthorizationStatus;
    if (status == TrackingStatus.notDetermined) {
      await AppTrackingTransparency.requestTrackingAuthorization();
    }
  }
  Future<User> signInWithFacebook() async {
    final LoginResult loginResult = await FacebookAuth.instance.login(
      loginTracking: LoginTracking.enabled,
      permissions: ['email', 'public_profile'],
    );

    if (loginResult.status != LoginStatus.success) {
      throw Exception('Facebook login failed: ${loginResult.status} - ${loginResult.message}');
    }

    final AccessToken accessToken = loginResult.accessToken as AccessToken;
    final OAuthCredential facebookAuthCredential =
    FacebookAuthProvider.credential(accessToken.tokenString);

    try {
      return (await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential)).user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        throw CustomException(
          message: 'An account already exists with this email using a different sign-in method (Google or email/password). Please sign in that way instead.',
        );
      }
      rethrow;
    }
  }

}
