import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/core/widgets/custom_button.dart';

import '../../../../../core/utilis/app_text_styles.dart';
import '../../../../../core/utilis/assets.dart';

class LocationViewBody extends StatelessWidget {
  const LocationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Image.asset(Assets.location),
          SizedBox(height: 93.5,),
          CustomButton(onPressed: (){}, text: 'ACCESS LOCATION'),
          SizedBox(height: 36.5,),
          Text('DFOOD WILL ACCESS YOUR LOCATION \n'
              'ONLY WHILE USING THE APP',
            textAlign: TextAlign.center,
            style:TextStyles.bold16.copyWith(color: Color(0xff646982)) ,)
        ],
      ),
    );
  }
}
