import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Services/get_it.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/Animation/opacity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Use%20Case/get_all_categories.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/get_all_categories/get_all_categories_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Category%20Page%20Widgets/Bloc%20Widgets/all_categories_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OwnerHomeView extends StatelessWidget {
  const OwnerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetAllCategoriesCubit(getIt.get<GetAllCategoriesUseCase>())
            ..getAllCategories(),
      child: AppAnimatedOpacity(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                  child: Column(children: [
                Space.topPageSpace,
                Text("All Categories", style: Fonts.font40_700White),
                Space.k40,
              ])),
              const AllCategoriesListViewBlocBuilder(),
              SliverToBoxAdapter(child: Space.bottomSpace)
            ],
          ),
        ),
      ),
    );
  }
}
