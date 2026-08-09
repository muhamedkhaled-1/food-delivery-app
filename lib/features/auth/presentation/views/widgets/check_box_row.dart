import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utilis/app_text_styles.dart';

class CheckBoxRow extends StatefulWidget {
  const CheckBoxRow({super.key});

  @override
  State<CheckBoxRow> createState() => _CheckBoxRowState();
}

class _CheckBoxRowState extends State<CheckBoxRow> {
  bool isRememberMe = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: isRememberMe,
          onChanged: (value) {
            setState((){
              isRememberMe=value!;
            });
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          side: const BorderSide(
            color: Color(0xffDCE4ED),
            width: 3,
          ),
          activeColor: Colors.orange,
        ),
        Text(
          'Remember me',
          style: TextStyles.bold13.copyWith(color:Color(0xFF7E8A97) ),
        ),
        Spacer(),
        GestureDetector(
          onTap: (){},
          child: Text('Forget Password',
            style:TextStyles.bold14.copyWith(color: KprimaryColor) ,),
        )
      ],
    );
  }
}
