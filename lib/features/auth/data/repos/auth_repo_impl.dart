import 'package:dartz/dartz.dart';
import 'package:food_delivery_app/core/errors/failures.dart';
import 'package:food_delivery_app/core/services/firebase_auth_services.dart';
import 'package:food_delivery_app/features/auth/data/models/user_model.dart';
import 'package:food_delivery_app/features/auth/domain/entities/user_entity.dart';
import 'package:food_delivery_app/features/auth/domain/repos/auth_repo.dart';

import '../../../../core/errors/exception.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthServices firebaseAuthServices;

  AuthRepoImpl({
    required this.firebaseAuthServices,
  });

  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword(
      String email,
      String password,
      String name,
      ) async {
    try {
      final user =
      await firebaseAuthServices.createUserWithEmailAndPassword(
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
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword(
      String email,
      String password,
      ) async {
    try {
      final user =
      await firebaseAuthServices.signInWithEmailAndPassword(
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
}