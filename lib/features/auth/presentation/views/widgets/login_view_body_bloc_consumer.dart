import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/features/home/presentation/views/home_view.dart';
import 'package:food_delivery_app/features/location/presentation/views/location_view.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../cubits/signin_cubit/signin_cubit.dart';
import 'login_view_body.dart';

class LoginViewBodyBlocConsumer extends StatelessWidget {
  const LoginViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          Navigator.pushNamed(context, LocationView.routeName);
        }

        if (state is SigninFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)));
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is SigninLoading ? true : false,
            child: LoginViewBody());
      },
    );
  }
}