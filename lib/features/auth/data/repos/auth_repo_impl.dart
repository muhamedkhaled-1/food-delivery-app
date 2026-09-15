import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:food_delivery_app/core/errors/failures.dart';
import 'package:food_delivery_app/core/services/database_service.dart';
import 'package:food_delivery_app/core/services/firebase_auth_services.dart';
import 'package:food_delivery_app/core/utilis/backend_endpoint.dart';
import 'package:food_delivery_app/features/auth/data/models/user_model.dart';
import 'package:food_delivery_app/features/auth/domain/entities/user_entity.dart';
import 'package:food_delivery_app/features/auth/domain/repos/auth_repo.dart';

import '../../../../core/errors/exception.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;
  final DatabaseService databaseService;

  AuthRepoImpl({
    required this.firebaseAuthServices,
    required this.databaseService,
  });

  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    User? user;
    try {
      user = await firebaseAuthServices.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      var userEntity = UserEntity(name: name, email: email, uId: user.uid);
      await addUserData(user: userEntity);
      return right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      return left(
        ServerFailure(message: e.message),
      );
    } catch (e) {
      await deleteUser(user);
      return left(
        ServerFailure(
          message: 'There was an error, please try again later.',
        ),
      );
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await firebaseAuthServices.deleteUser();
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final user = await firebaseAuthServices.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return right(UserModel.fromFirebaseUser(user));
    } on CustomException catch (e) {
      return left(
        ServerFailure(message: e.message),
      );
    } catch (e) {
      return left(
        ServerFailure(
          message: 'There was an error, please try again later.',
        ),
      );
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithGoogle() async {
    User ?user;
    try {
       user = await firebaseAuthServices.signInWithGoogle();
       var userEntity=UserModel.fromFirebaseUser(user);
       await addUserData(user: userEntity);
      return right(userEntity);
    } catch (e) {
      await deleteUser(user);
      log('Exception in sign in with google:: ${e.toString()}');
      return left(ServerFailure(message: 'Theres a problem try again later'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithFacebook() async {
    User ?user;
    try {
      await firebaseAuthServices.requestTrackingPermission();
       user = await firebaseAuthServices.signInWithFacebook();
      var userEntity=UserModel.fromFirebaseUser(user);
      await addUserData(user: userEntity);
      return Right(userEntity);
    } on FirebaseAuthException catch (e) {
      await deleteUser(user);
      if (e.code == 'account-exists-with-different-credential') {
        final pendingCredential = FacebookAuthProvider.credential(
          (await FacebookAuth.instance.accessToken)!.tokenString,
        );
        return left(AccountLinkingFailure(
          email: e.email!,
          pendingCredential: pendingCredential,
        ));
      }
      return left(ServerFailure(message: 'Theres a problem try again later'));
    } catch (e) {
      await deleteUser(user);
      log('Exception in sign in with facebook:: ${e.toString()}');
      return left(ServerFailure(
          message:
              'An account already exists with this email using a different sign-in method (Google or email/password). Please sign in that way instead.'));
    }
  }

  @override
  @override
  Future<Either<Failures, UserEntity>> signInWithApple() async {
    User?user;
    try {
       user = await firebaseAuthServices.signInWithApple();
      var userEntity=UserModel.fromFirebaseUser(user);
      await addUserData(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      await deleteUser(user);
      log('Exception in sign in with apple:: ${e.message}');
      return left(ServerFailure(message: e.message));
    } catch (e) {
      await deleteUser(user);
      log('Exception in sign in with apple:: ${e.toString()}');
      return left(ServerFailure(message: 'Theres a problem try again later'));
    }
  }

  @override
  Future<dynamic> addUserData({required UserEntity user}) async {
    await databaseService.addData(
        path: BackendEndpoint.addUserData, data: user.toMap());
  }
}
