import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_text_form_field.dart';

class PasswordField extends StatefulWidget {
  final void Function(String?)? onSaved;
   PasswordField({
    super.key, this.onSaved,
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}
bool obscureText=true;
class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      obscureText: obscureText,
      onSaved: widget.onSaved,
        suffixIcon: GestureDetector(
          onTap: () {
            obscureText=!obscureText;
            setState(() {
            });
          },
          child: obscureText? Icon(Icons.remove_red_eye,
            color:Color(0xffA0A5BA) ,):Icon(Icons.visibility_off_outlined,
            color:Color(0xffA0A5BA) ,),
        ),
        hintText: '**********',
        textInputType: TextInputType.visiblePassword);
  }
}