import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/features/auth/presentation/views/signup_view.dart';

import '../../../../../constants.dart';
import '../../../../../core/utilis/app_text_styles.dart';

class DontHaveAccountRow extends StatelessWidget {
  const DontHaveAccountRow({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don’t have an account?',
          style: TextStyles.bold16.copyWith(color: Color(0xFF646982)),
        ),
        SizedBox(width: 11,),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, SignupView.routeName);
          },
          child: Text('SIGN UP',
            style: TextStyles.semiBold14.copyWith(color: KprimaryColor),
          ),
        )
      ],
    );
  }
}
