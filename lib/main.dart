import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/splash/presention/views/splash_view.dart';

import 'core/helper_function/on_genrate_route.dart';

void main() {
  runApp( FoodDeliveryApp());
}

class FoodDeliveryApp extends StatelessWidget {
  const FoodDeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute:onGenrateRoute,
      initialRoute: SplashView.routeName,

    );
  }
}

