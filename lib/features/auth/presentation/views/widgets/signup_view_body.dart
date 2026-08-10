import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/widgets/custom_button.dart';
import 'package:food_delivery_app/core/widgets/custom_text_form_field.dart';
import 'package:food_delivery_app/features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:food_delivery_app/features/auth/presentation/views/widgets/custom_auth_body.dart';

import '../../../../../core/utilis/app_text_styles.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                  title: 'Sign Up',
                  subtitle: 'Please sign up to get started'),
              SizedBox(
                height: 49,
              ),
              CustomAuthBody(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: TextStyles.bold13,
                      ),
                      SizedBox(height: 8),
                      CustomTextFormField(
                          hintText: 'John doe',
                          textInputType: TextInputType.name),
                      SizedBox(height: 24,),
                      Text(
                        'Email',
                        style: TextStyles.bold13,
                      ),
                      SizedBox(height: 8),
                      CustomTextFormField(
                          hintText: 'example@gmail.com',
                          textInputType: TextInputType.emailAddress),
                      SizedBox(height: 24,),
                      Text(
                        'Password',
                        style: TextStyles.bold13,
                      ),
                      SizedBox(height: 8),
                      CustomTextFormField(
                        suffixIcon: Icon(Icons.visibility_off_outlined,
                          color:Color(0xffA0A5BA) ,),
                          hintText: '**********',
                          textInputType: TextInputType.visiblePassword),
                      SizedBox(height: 24,),
                      Text(
                        'Re-Type Password',
                        style: TextStyles.bold13,
                      ),
                      SizedBox(height: 8),
                      CustomTextFormField(
                          suffixIcon: Icon(Icons.visibility_off_outlined,
                            color:Color(0xffA0A5BA) ,),
                          hintText: '**********',
                          textInputType: TextInputType.visiblePassword),
                      SizedBox(height: 47,),
                      CustomButton(onPressed: (){},
                          text: 'Sign Up'),
                      SizedBox(height: 39,)
                    ],
                  ))
            ],
          ),
        );
      },
    );
  }
}
