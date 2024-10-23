import 'package:coffee_oasis/Core/Routes/routes_keys.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/category_entity.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Category%20Page%20Widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class OwnerAllCategoiresListView extends StatelessWidget {
  const OwnerAllCategoiresListView({
    super.key, required this.categories,
  });
  final List<CategoryEntity> categories;
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
            child: CategoryCard(
              categoryEntity: categories[index],
            ));
      }, childCount: categories.length),
    );
  }
}
