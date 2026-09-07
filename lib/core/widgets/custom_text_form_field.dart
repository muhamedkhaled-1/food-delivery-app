import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/utilis/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      this.suffixIcon,
      required this.textInputType, this.onSaved});

  final String hintText;
  final Widget? suffixIcon;
  final TextInputType textInputType;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved:onSaved ,
      validator: (value) {
        if(value==null || value.isEmpty){
          return 'This field is required';
        }
      },
      keyboardType: textInputType,
      cursorColor: Color(0xFFF121223),
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: TextStyles.bold14.copyWith(color: Color(0xffA0A5BA)),
          filled: true,
          fillColor: Color(0xffF0F5FA),
          enabledBorder: buildBorder(),
          border: buildBorder(),
          focusedBorder: buildBorder()),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Color(0xffF0F5FA),
      ),
    );
  }
}
