import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/core/widgets/custom_button.dart';
import 'package:food_delivery_app/features/auth/presentation/views/login_view.dart';
import 'package:food_delivery_app/features/on_boarding/presentation/views/widgets/on_boarding_page_view.dart';
import 'package:food_delivery_app/features/on_boarding/presentation/views/widgets/page_view_item.dart';
import '../../../../../core/services/shared_preferences/shared_preferences_singleton.dart';
import '../../../../../core/utilis/assets.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  late PageController pageController;
  var currentPage=0;
  @override
  void initState() {
    pageController=PageController();
    pageController.addListener((){
      currentPage=pageController.page!.toInt();
      setState(() {
      });
    });
    super.initState();
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:26,right: 25),
      child: Column(
        children: [
          Expanded(child: OnBoardingPageView(
            pageController: pageController,
          )),
          SizedBox(height: 32,),
          DotsIndicator(
            position: currentPage.toDouble(),
            dotsCount: 3,
            decorator: DotsDecorator(
                activeColor:KprimaryColor,
                color:currentPage==3?KprimaryColor: KprimaryColor.withOpacity(.5)
            ),
          ),
          SizedBox(height: 70,),
          CustomButton(onPressed: (){
            if (currentPage<2) {
              pageController.nextPage(duration: Duration(milliseconds: 300),
                  curve: Curves.easeOut);
            }else{
              Navigator.pushReplacementNamed(context, LoginView.routeName);
            }
            Prefs.setBool(KIsOnBoardingViewSeen, true);
          }, text: 'Next'),
          SizedBox(height:16 ,),
          GestureDetector(
            onTap: (){
              Navigator.pushReplacementNamed(context, LoginView.routeName);
              Prefs.setBool(KIsOnBoardingViewSeen, true);
            },
            child: Text('Skip',style: TextStyle(
                fontSize: 16,
                color: Color(0xFFF646982)
            ),),
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}

