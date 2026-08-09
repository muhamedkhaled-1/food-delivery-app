import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAuthBody extends StatelessWidget {
  const CustomAuthBody({super.key, required this.height, required this.child});
  final double height;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      height: height,
      width: double.infinity,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }
}
