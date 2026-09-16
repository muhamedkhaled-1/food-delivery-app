import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/services/custom_bloc_observer.dart';
import 'package:food_delivery_app/features/splash/presention/views/splash_view.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'core/helper_function/on_genrate_route.dart';
import 'core/services/get_it_services.dart';
import 'core/services/location_service.dart';
import 'core/services/shared_preferences/shared_preferences_singleton.dart';
import 'features/location/presentation/cubit/location_cubit.dart';
import 'firebase_options.dart';

void main() async{
  Bloc.observer=CustomBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await GoogleSignIn.instance.initialize(
    clientId:'181907846295-cdep3pnv683iedkvlb1djg87jcecttt3.apps.googleusercontent.com',
    serverClientId: '181907846295-shkoj6cfttamqjk3vkibs0p2mna36qai.apps.googleusercontent.com',
  );

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Prefs.init();
  setupGetit();
  debugPrint(
    'LocationService registered: ${getIt.isRegistered<LocationService>()}',
  );

  debugPrint(
    'LocationCubit registered: ${getIt.isRegistered<LocationCubit>()}',
  );

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

