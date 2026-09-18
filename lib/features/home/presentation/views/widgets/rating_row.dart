import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/features/home/presentation/views/widgets/info_item.dart';

import '../../../../../core/utilis/assets.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({super.key, required this.rating, required this.delFees, required this.time});
  final String rating,delFees,time;
  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(child: InfoItem(image: Assets.star, text: rating)),
        Expanded(child: InfoItem(image: Assets.delivery, text: delFees)),
        Expanded(child: InfoItem(image: Assets.clock, text: time)),
        Spacer()

      ],
    );
  }
}
