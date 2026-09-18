import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utilis/assets.dart';
import 'package:food_delivery_app/features/home/presentation/views/widgets/rating_row.dart';

import '../../../../../core/utilis/app_text_styles.dart';

class RestaurantListItem extends StatelessWidget {
  const RestaurantListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(15),
            child: Image.asset(
              Assets.foodTest,
              fit: BoxFit.fill,
              width: double.infinity,
              height: 150,
            ),),
        SizedBox(
          height: 8,
        ),
        Text('Rose Garden Restaurant',style: TextStyles.bold20,),
        SizedBox(height: 2,),
        Text('Burger - Chiken - Riche - Wings ',style: TextStyles.bold14.copyWith(color: Color(0xFFA0A5BA)),),
        SizedBox(height: 14,),
        RatingRow()
      ],
    );
  }
}
