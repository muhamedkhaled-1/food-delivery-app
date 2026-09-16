import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/constants.dart';

import '../../../../../core/utilis/app_text_styles.dart';
import '../../../../../core/utilis/assets.dart';
import '../../../../location/presentation/cubit/location_cubit.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        String location = 'Getting location...';

        if (state is LocationSuccess) {
          location = state.locationName;
        }

        if (state is LocationFailure) {
          location = 'Location unavailable';
        }

        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(Assets.menu,),
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),

          ),

          title: Text(
            'Deliver to',
            style: TextStyles.semiBold12.copyWith(
              color: KprimaryColor,
            ),
          ),

          subtitle: Text(
            location,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.semiBold12,
          ),

          trailing: Container(
            padding: const EdgeInsets.all(12),
            decoration: const ShapeDecoration(
              color: Color(0xFF181C2E),
              shape: OvalBorder(
                side: BorderSide(width: 1),
              ),
            ),
            child: SvgPicture.asset(
              Assets.homeIcon,
            ),
          ),
        );
      },
    );
  }
}