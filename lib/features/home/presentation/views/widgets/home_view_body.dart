import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/features/home/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:food_delivery_app/features/home/presentation/views/widgets/user_name_line.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsetsGeometry.only(left: 14,right: 24),
          sliver: SliverToBoxAdapter(
            child: CustomHomeAppBar(),
          ),
        ),
        SliverPadding(padding: EdgeInsetsGeometry.only(left: 24),
          sliver:  SliverToBoxAdapter(
          child: UserNameLine(),
        ),)

      ],
    );
  }
}
