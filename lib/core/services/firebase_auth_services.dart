import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery_app/core/errors/exception.dart';
import 'package:food_delivery_app/features/auth/domain/entities/user_entity.dart';

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
}
