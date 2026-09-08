import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/core/services/get_it_services.dart';
import 'package:food_delivery_app/features/auth/domain/repos/auth_repo.dart';
import 'package:food_delivery_app/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:food_delivery_app/features/auth/presentation/views/widgets/login_view_body.dart';
import 'package:food_delivery_app/features/auth/presentation/views/widgets/login_view_body_bloc_consumer.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const routeName = 'loginView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
        backgroundColor: Color(0xFFF121223),
        body: LoginViewBodyBlocConsumer(),
      ),
    );
  }
}


