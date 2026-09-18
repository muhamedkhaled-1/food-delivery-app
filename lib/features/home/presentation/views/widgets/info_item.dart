import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utilis/app_text_styles.dart';

class InfoItem extends StatelessWidget {
  const InfoItem({
    required this.image,
    required this.text,
  });

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(image),
        const SizedBox(width: 4),
        Text(
          text,
          style:TextStyles.bold16
        ),
      ],
    );
  }
}