import 'package:coffee_oasis/Core/Routes/routes_keys.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AllCategoiresListView extends StatelessWidget {
  const AllCategoiresListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 20.w,
          mainAxisSpacing: 20.h),
      delegate: SliverChildBuilderDelegate((context, index) {
        return GestureDetector(
            onTap: () {
              GoRouter.of(context).push(Routes.category);
            },
            child: const CategoryCard());
      }, childCount: 20),
    );
  }
}
