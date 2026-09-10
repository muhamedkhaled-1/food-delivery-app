import 'package:food_delivery_app/core/errors/failures.dart';
import 'package:food_delivery_app/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failures,UserEntity>> createUserWithEmailAndPassword(
      String email, String password,String name);

  Future<Either<Failures,UserEntity>> signInWithEmailAndPassword(
      String email, String password);

  Future<Either<Failures,UserEntity>> signInWithGoogle();

  Future<Either<Failures,UserEntity>> signInWithFacebook();
}
