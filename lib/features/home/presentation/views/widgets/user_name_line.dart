import 'package:flutter/cupertino.dart';

import '../../../../../core/utilis/app_text_styles.dart';

class UserNameLine extends StatelessWidget {
  const UserNameLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Hey Halal,',style: TextStyles.bold16,),
        Text(' Good Afternoon!',style: TextStyles.semiBold16,)
      ],
    );
  }
}
