import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/core/widgets/search_text_field.dart';
import 'package:food_delivery_app/features/home/presentation/views/widgets/all_categories_row.dart';
import 'package:food_delivery_app/features/home/presentation/views/widgets/categories_list_item.dart';
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
        ),),
        SliverPadding(
          padding:EdgeInsetsGeometry.only(left: 24,right: 24,top: 16),
          sliver: SliverToBoxAdapter(
            child: SearchTextField(),
          ),
        ),
        SliverPadding(
          padding:EdgeInsetsGeometry.only(left: 24,right: 24,top: 32),
        sliver: SliverToBoxAdapter(child: AllCategoriesRow(),),
        ),
        SliverPadding(
          padding:EdgeInsetsGeometry.only(left: 24,right: 24,top: 21),
          sliver: SliverToBoxAdapter(child: CategoriesListItem(),),
        )


      ],
    );
  }
}
