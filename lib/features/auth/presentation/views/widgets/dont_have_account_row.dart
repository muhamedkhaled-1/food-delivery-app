import 'package:flutter/cupertino.dart';

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
        Text('SIGN UP',
          style: TextStyles.semiBold14.copyWith(color: KprimaryColor),
        )
      ],
    );
  }
}
