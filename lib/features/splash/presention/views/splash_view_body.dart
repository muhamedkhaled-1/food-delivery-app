import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/features/on_boarding/presentation/views/on_boarding_view.dart';

import '../../../../assets/assets.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNavigation();
    super.initState();
  }
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

  void excuteNavigation() {
    Future.delayed(Duration(
      seconds: 2),() {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      },);
  }
}
