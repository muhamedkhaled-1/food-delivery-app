import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/core/utilis/assets.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({super.key, required this.image, required this.title, required this.subtitle});
  final String image,title,subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height*.5,
            child: Image.asset(image))),
         SizedBox(height: 63,),
         Text(title,style: TextStyle(
           fontSize: 24,
           fontWeight: FontWeight.w800
         ),),
         SizedBox(height: 18,),
         Text(subtitle,style: TextStyle(
           color: Color(0xFFF646982),
             fontSize: 15,
             fontWeight: FontWeight.w400
         ),),
      ],
    );
  }
}
