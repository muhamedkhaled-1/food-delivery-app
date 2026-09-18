import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/features/home/presentation/views/widgets/restaurant_list_item.dart';

import '../../../../../core/utilis/assets.dart';

class RestaurantSliverList extends StatelessWidget {
  const RestaurantSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              left: 24,
              right: 24,
              bottom: 28,
            ),
            child: RestaurantListItem(
              image: Assets.foodTest,
              restaurantName: 'Rose Garden Restaurant',
              restaurantDoing: 'Burger - Chicken - Riche - Wings',
              rating: '4.7',
              delFees: 'Free',
              time: '20 min',
            ),
          );
        },
        childCount: 5,
      ),
    );
  }
}