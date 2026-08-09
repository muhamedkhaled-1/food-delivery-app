import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utilis/assets/assets.dart';

class SocialMediaAuth extends StatelessWidget {
  const SocialMediaAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Assets.facebook),
        SizedBox(width: 30,),
        SvgPicture.asset(Assets.twitter),
        SizedBox(width: 30,),
        SvgPicture.asset(Assets.apple),
      ],
    );
  }
}
