import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/features/home/presentation/views/widgets/rating_row.dart';

import '../../../../../core/utilis/app_text_styles.dart';

class RestaurantListItem extends StatelessWidget {
  const RestaurantListItem({
    super.key,
    required this.image,
    required this.restaurantName,
    required this.restaurantDoing,
    required this.rating,
    required this.delFees,
    required this.time,
  });

  final String image;
  final String restaurantName;
  final String restaurantDoing;
  final String rating;
  final String delFees;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            image,
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover,
          ),
        ),

        const SizedBox(height: 8),

        Text(
          restaurantName,
          style: TextStyles.bold20,
        ),

        const SizedBox(height: 2),

        Text(
          restaurantDoing,
          style: TextStyles.bold14.copyWith(
            color: const Color(0xFFA0A5BA),
          ),
        ),

        const SizedBox(height: 14),

        RatingRow(
          rating: rating,
          delFees: delFees,
          time: time,
        ),
      ],
    );
  }
}