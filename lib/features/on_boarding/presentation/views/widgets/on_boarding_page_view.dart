import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/features/on_boarding/presentation/views/widgets/page_view_item.dart';

import '../../../../../core/utilis/assets.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
 final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        PageViewItem(
          title: 'All your favorites',
          subtitle: 'Get all your loved foods in one once place,\n   you just place the order we do the rest',
          image: Assets.Onboarding_image_1,
        ),
        PageViewItem(
          title: 'Order from choosen chef',
          subtitle: 'Get all your loved foods in one once place,\n   you just place the order we do the rest',
          image: Assets.Onboarding_image_2,
        ),
        PageViewItem(
          title: 'Free delivery offers',
          subtitle: 'Get all your loved foods in one once place,\n   you just place the order we do the rest',
          image: Assets.Onboarding_image_3,
        )
      ],
    );
  }
}
