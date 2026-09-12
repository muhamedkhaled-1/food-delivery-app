import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/core/widgets/custom_button.dart';
import 'package:food_delivery_app/core/widgets/custom_text_form_field.dart';
import 'package:food_delivery_app/features/auth/presentation/cubits/signup_cubit/signup_cubit.dart';
import 'package:food_delivery_app/features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:food_delivery_app/features/auth/presentation/views/widgets/custom_auth_body.dart';

import '../../../../../core/utilis/app_text_styles.dart';
import '../../../../../core/widgets/password_field.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String email, password, name;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          CustomAppBar(
              title: 'Sign Up',
              subtitle: 'Please sign up to get started'),
          const SizedBox(height: 49),
          Expanded(
            child: CustomAuthBody(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name', style: TextStyles.bold13),
                  const SizedBox(height: 8),
                  CustomTextFormField(
                      onSaved: (value) {
                        name = value!;
                      },
                      hintText: 'John doe',
                      textInputType: TextInputType.name),
                  const SizedBox(height: 24),
                  Text('Email', style: TextStyles.bold13),
                  const SizedBox(height: 8),
                  CustomTextFormField(
                      onSaved: (value) {
                        email = value!;
                      },
                      hintText: 'example@gmail.com',
                      textInputType: TextInputType.emailAddress),
                  const SizedBox(height: 24),
                  Text('Password', style: TextStyles.bold13),
                  const SizedBox(height: 8),
                  PasswordField(
                    onSaved: (value) {
                      password = value!;
                    },
                  ),
                  const SizedBox(height: 24),
                  Text('Re-Type Password', style: TextStyles.bold13),
                  const SizedBox(height: 8),
                  PasswordField(),
                  const SizedBox(height: 47),
                  CustomButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          context
                              .read<SignupCubit>()
                              .createUserWithEmailAndPassword(
                              email, password, name);
                        } else {
                          setState(() {
                            autovalidateMode = AutovalidateMode.always;
                          });
                        }
                      },
                      text: 'Sign Up'),
                  const SizedBox(height: 39),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}