import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/constants.dart';
import 'package:food_delivery_app/core/widgets/custom_button.dart';
import 'package:food_delivery_app/core/widgets/custom_text_form_field.dart';
import 'package:food_delivery_app/core/widgets/password_field.dart';
import 'package:food_delivery_app/features/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:food_delivery_app/features/auth/presentation/views/widgets/check_box_row.dart';
import 'package:food_delivery_app/features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:food_delivery_app/features/auth/presentation/views/widgets/custom_auth_body.dart';
import 'package:food_delivery_app/features/auth/presentation/views/widgets/dont_have_account_row.dart';
import 'package:food_delivery_app/features/auth/presentation/views/widgets/social_media_auth.dart';

import '../../../../../core/utilis/app_text_styles.dart';

class LoginViewBody extends StatefulWidget {
   LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
   AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
late String email,password;
final GlobalKey<FormState> formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                CustomAppBar(
                  title: 'Log in',
                  subtitle: 'Please sign in to your existing account',
                ),
                const SizedBox(height: 50),
                CustomAuthBody(
                  // height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email',
                      style: TextStyles.bold13,
                      ),
                      SizedBox(height: 8,),
                      CustomTextFormField(
                        onSaved: (value){
                          email=value!;
                        },
                        hintText: 'example@gmail.com',
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 24,),
                      Text('Password',
                        style: TextStyles.bold13,
                      ),
                      SizedBox(height: 8,),
                     PasswordField(
                       onSaved: (value){
                         password=value!;
                       },
                     ),
                      SizedBox(height: 20,),
                      CheckBoxRow(),
                      SizedBox(height: 31,),
                      CustomButton(onPressed: (){
                        if(formKey.currentState!.validate()){
                          formKey.currentState!.save();
                          context.read<SigninCubit>().SingnUser(email, password);
                        }else{
                          autovalidateMode= AutovalidateMode.always;
                          setState(() {

                          });
                        }
                      },
                          text: 'Log In'),
                      SizedBox(height: 38,),
                     DontHaveAccountRow(),
                      SizedBox(height: 27,),
                      Center(
                        child: Text('Or',
                        style: TextStyles.bold16.copyWith(color: Color(0xFF646982)),
                        ),
                      ),
                      SizedBox(height: 15,),
                      SocialMediaAuth(),
                      SizedBox(height: 39,)

                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
