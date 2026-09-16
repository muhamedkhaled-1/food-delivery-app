import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/location/presentation/views/widgets/location_view_body.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key});
   static const routeName='location_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: LocationViewBody()),
    );
  }
}
