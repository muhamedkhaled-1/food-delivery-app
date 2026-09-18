import 'package:flutter/material.dart';
import 'package:food_delivery_app/features/home/presentation/views/widgets/header_row.dart';

import '../../../../../core/utilis/app_text_styles.dart';

class AllCategoriesRow extends StatelessWidget {
  const AllCategoriesRow({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderRow(
        headerName: 'All Categories',
      onTap: () {

      },
    );
  }
}