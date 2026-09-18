import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utilis/app_text_styles.dart';

class HeaderRow extends StatelessWidget {
  const HeaderRow({super.key, required this.headerName, required this.onTap});
  final String headerName;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          headerName,
          style: TextStyles.semiBold16,
        ),
        Spacer(),
        GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'See all',
                style: TextStyles.bold16,
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.arrow_forward_ios_outlined,
                size: 16,
              ),
            ],
          ),
        ),
      ],
    );;
  }
}
