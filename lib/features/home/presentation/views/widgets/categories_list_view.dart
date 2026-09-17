import 'package:flutter/cupertino.dart';

import '../../../../../core/utilis/assets.dart';
import 'categories_list_item.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(5,
              (index) {
            return Padding(
              padding: const EdgeInsets.only(left: 16),
              child: CategoriesListItem(
                image: Assets.pizzaTest,
                title: 'Pizza',
              ),
            );
          },
        ),
      ),
    );
  }
}