import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/core/services/get_it_services.dart';
import 'package:food_delivery_app/features/auth/domain/repos/auth_repo.dart';
import 'package:food_delivery_app/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:food_delivery_app/features/auth/presentation/views/widgets/sign_up_view_body_bloc_consumer.dart';
import 'package:food_delivery_app/features/auth/presentation/views/widgets/signup_view_body.dart';


class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const routeName = 'signUpView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          SignupCubit(
              getIt<AuthRepo>()),
      child: Scaffold(
        backgroundColor: Color(0xFFF121223),
        body: SignUpViewBodyBlocConsumer(),
      ),
    );
  }


}
