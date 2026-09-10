import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';

import '../../../../../core/utilis/assets/assets.dart';

class SocialMediaAuth extends StatefulWidget {
  const SocialMediaAuth({super.key});

  @override
  State<SocialMediaAuth> createState() => _SocialMediaAuthState();
}

class _SocialMediaAuthState extends State<SocialMediaAuth> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    final iconSize = (screenWidth * 0.14).clamp(40.0, 55.0);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: iconSize,
          height: iconSize,
          child: GestureDetector(
            onTap: () {
              context.read<SigninCubit>().signInWithGoogle();
            },
            child: SvgPicture.asset(
              Assets.google,
              fit: BoxFit.contain,
            ),
          ),
        ),

        SizedBox(
          width: iconSize,
          height: iconSize,
          child: SvgPicture.asset(
            Assets.facebook,
            fit: BoxFit.contain,
          ),
        ),

        SizedBox(
          width: iconSize,
          height: iconSize,
          child: SvgPicture.asset(
            Assets.apple,
            fit: BoxFit.contain,
          ),
        ),

        SizedBox(
          width: iconSize,
          height: iconSize,
          child: SvgPicture.asset(
            Assets.twitter,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}