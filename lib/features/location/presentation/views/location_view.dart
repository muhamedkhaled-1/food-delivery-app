import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/core/services/location_service.dart';
import 'package:food_delivery_app/features/location/presentation/views/widgets/location_view_body.dart';
import 'package:food_delivery_app/features/location/presentation/views/widgets/location_view_body_bloc_consumer.dart';

import '../cubit/location_cubit.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key});

  static const routeName = 'location_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => LocationCubit(LocationService()),
        child: SafeArea(child: LocationViewBodyBlocConsumer()),
      ),
    );
  }
}
