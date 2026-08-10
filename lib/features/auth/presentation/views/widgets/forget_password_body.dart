import 'package:flutter/cupertino.dart';

import '../../../../../core/utilis/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import 'custom_app_bar.dart';
import 'custom_auth_body.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                title: 'Forgot Password',
                subtitle: 'Please type your email',
              ),

              const SizedBox(height: 49),

              ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight - 49,
                ),
                child: CustomAuthBody(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyles.bold13,
                      ),

                      const SizedBox(height: 8),

                      CustomTextFormField(
                        hintText: 'example@gmail.com',
                        textInputType: TextInputType.emailAddress,
                      ),

                      const SizedBox(height: 30),

                      CustomButton(
                        onPressed: () {},
                        text: 'Send Code',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}