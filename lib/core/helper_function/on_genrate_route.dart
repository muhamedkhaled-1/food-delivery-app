import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/splash/presention/views/splash_view.dart';

import '../../features/on_boarding/presentation/views/on_boarding_view.dart';

Route<dynamic> onGenrateRoute (RouteSettings settings){

  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView(),);
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView(),);

    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(),
      );
  }
}