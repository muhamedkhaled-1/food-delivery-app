import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/core/widgets/custom_button.dart';
import 'package:food_delivery_app/features/on_boarding/presentation/views/widgets/page_view_item.dart';
import '../../../../../core/utilis/assets/assets.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:26,right: 25,top: 50),
      child: PageView(
        children: [
          Column(
            children: [
              PageViewItem(
                title: 'All your favorites',
                subtitle: 'Get all your loved foods in one once place,\n   you just place the order we do the rest',
                image: Assets.Onboarding_image_1,

              ),
              SizedBox(height: 32,),
              DotsIndicator(dotsCount: 3,
              decorator: DotsDecorator(
                  activeColor:KprimaryColor,
                color: KprimaryColor.withOpacity(.5)
              ),
              ),
              SizedBox(height: 70,),
              CustomButton(onPressed: (){}, text: 'Next'),
              SizedBox(height:16 ,),
              GestureDetector(
                onTap: (){},
                child: Text('Skip',style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFFF646982)
                ),),
              )
            ],
          )
        ],
      ),
    );
  }
}
