import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  Future<void> signInWithGoogle()async{
    emit(SigninLoading());
    var result=await authRepo.signInWithGoogle();
    result.fold(
        (failure)=>emit(SigninFailure(message: failure.message)),
        (userEntity)=>emit(SigninSuccess(userEntity: userEntity)),
    );
  }
  Future<void> signInWithFacebook() async {
    emit(SigninLoading());
    var result = await authRepo.signInWithFacebook();
    result.fold(
          (failure) {
        if (failure is AccountLinkingFailure) {
          emit(SigninRequiresLinking(
            email: failure.email,
            pendingCredential: failure.pendingCredential,
          ));
        } else {
          emit(SigninFailure(message: failure.message));
        }
      },
          (userEntity) => emit(SigninSuccess(userEntity: userEntity)),
    );
  }

  Future<void> completeLinkingWithGoogle(OAuthCredential pendingFacebookCredential) async {
    emit(SigninLoading());
    var result = await authRepo.signInWithGoogle();
    result.fold(
          (failure) => emit(SigninFailure(message: failure.message)),
          (userEntity) async {
        try {
          await FirebaseAuth.instance.currentUser!.linkWithCredential(pendingFacebookCredential);
          emit(SigninSuccess(userEntity: userEntity));
        } catch (e) {
          emit(SigninFailure(message: 'Signed in, but failed to link Facebook.'));
        }
      },
    );
  }
}
