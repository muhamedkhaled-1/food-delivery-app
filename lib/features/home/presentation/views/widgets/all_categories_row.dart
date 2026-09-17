import 'package:flutter/material.dart';

import '../../../../../core/utilis/app_text_styles.dart';

class AllCategoriesRow extends StatelessWidget {
  const AllCategoriesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'All Categories',
          style: TextStyles.semiBold16,
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
          },
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
    );
  }
}