import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/features/home/presentation/views/widgets/info_item.dart';

import '../../../../../core/utilis/assets.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(child: InfoItem(image: Assets.star, text: '4.7')),
        Expanded(child: InfoItem(image: Assets.delivery, text: 'Free')),
        Expanded(child: InfoItem(image: Assets.clock, text: '20 min')),
        Spacer()

      ],
    );
  }
}
