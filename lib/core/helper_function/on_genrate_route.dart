import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/auth/presentation/views/forget_password_view.dart';
import 'package:food_delivery_app/features/auth/presentation/views/signup_view.dart';
import 'package:food_delivery_app/features/home/presentation/views/home_view.dart';
import 'package:food_delivery_app/features/location/presentation/views/location_view.dart';
import 'package:food_delivery_app/features/splash/presention/views/splash_view.dart';

import '../../features/auth/presentation/views/login_view.dart';
import '../../features/on_boarding/presentation/views/on_boarding_view.dart';

Route<dynamic> onGenrateRoute (RouteSettings settings){

  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView(),);
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView(),);
    case LoginView.routeName:
      return MaterialPageRoute(builder: (context) => const LoginView(),);
    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView(),);
    case ForgetPasswordView.routeName:
      return MaterialPageRoute(builder: (context) => const ForgetPasswordView(),);
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView(),);
    case LocationView.routeName:
      return MaterialPageRoute(builder: (context) => const LocationView(),);

    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(),
      );
  }
}