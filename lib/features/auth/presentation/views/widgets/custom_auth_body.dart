import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAuthBody extends StatelessWidget {
  const CustomAuthBody({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 24,right: 24,top: 24),
      child: child,
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
