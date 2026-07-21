import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.text});
  final VoidCallback onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 62,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
          ),
          backgroundColor: KprimaryColor,
        ),
          onPressed: onPressed,
          child: Text(text,style: TextStyle(
            color: Colors.white,
                fontSize: 14,
            fontWeight: FontWeight.w700
          ),)),
    );
  }
}
