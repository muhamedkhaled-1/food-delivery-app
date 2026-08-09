import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utilis/assets/assets.dart';

class CustomAppBar extends StatelessWidget {
   CustomAppBar({super.key, required this.title, required this.subtitle});
  final String title,subtitle;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * .24,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: SvgPicture.asset(
              Assets.login_header,
              width: size.width * .40,
            ),
          ),

          Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              Assets.login_header2,
              width: size.width * .16,
            ),
          ),

          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: size.height * .1),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children:  [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}