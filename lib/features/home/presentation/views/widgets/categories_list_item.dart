import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utilis/app_text_styles.dart';
import '../../../../../core/utilis/assets.dart';

class CategoriesListItem extends StatelessWidget {
  const CategoriesListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size.width * 0.3,
          height: size.width * 0.3,
          padding: const EdgeInsets.only(top:20,bottom: 21,right: 13,left: 13),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: const Offset(0, 15),
              ),
            ],
          ),
          child: Container(
            child: SvgPicture.asset(
              Assets.pizzaTest,
              fit: BoxFit.fill,),
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),

        const SizedBox(height: 14),

        // Pizza text
        Text(
          'Pizza',
          style: TextStyles.semiBold18,
        ),
      ],
    );
  }
}
