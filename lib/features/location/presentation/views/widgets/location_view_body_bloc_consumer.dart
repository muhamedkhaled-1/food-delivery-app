import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/features/location/presentation/views/widgets/location_view_body.dart';

import '../../cubit/location_cubit.dart';

class LocationViewBodyBlocConsumer extends StatelessWidget {
  const LocationViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationCubit, LocationState>(
      listener: (context, state) {
        if (state is LocationSuccess) {
          print('Latitude: ${state.latitude}');
          print('Longitude: ${state.longitude}');

          // Navigate to the next screen here
        }

        if (state is LocationFailure) {
          debugPrint('Location Error: ${state.message}');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),

            ),
          );
        }
      },
      builder: (context, state) {
        return LocationViewBody();
      },
    );
  }
}
