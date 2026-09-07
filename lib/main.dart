import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/splash/presention/views/splash_view.dart';

import 'core/helper_function/on_genrate_route.dart';
import 'core/services/get_it_services.dart';
import 'core/services/shared_preferences/shared_preferences_singleton.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Prefs.init();
  setupGetit();
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

