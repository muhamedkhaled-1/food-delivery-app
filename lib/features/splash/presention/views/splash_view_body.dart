import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../assets/assets.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(Assets.header),
          ],
        ),
        SvgPicture.asset(Assets.logo),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(Assets.bottom),
          ],
        )
      ],
    );
  }
}
