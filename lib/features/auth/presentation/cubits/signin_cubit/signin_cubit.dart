import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:food_delivery_app/core/errors/failures.dart';
import 'package:food_delivery_app/features/auth/domain/entities/user_entity.dart';
import 'package:food_delivery_app/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit(this.authRepo) : super(SigninInitial());
  final AuthRepo authRepo;
  Future<void> SingnUser(String email,String password)async{
    emit(SigninLoading());
    Either<Failures,UserEntity> result=await authRepo.signInWithEmailAndPassword(email, password);
    result.fold((failure)=>emit(SigninFailure(message: failure.message)),
        (userEntity)=>emit(SigninSuccess(userEntity: userEntity)));
  }
}
