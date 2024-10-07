import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/all_categroies_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OwnerHomeView extends StatelessWidget {
  const OwnerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
              child: Column(children: [
            Space.topSpace,
            Text("All Categories", style: Fonts.font40_700White),
            Space.topSpace,
          ])),
          const AllCategoiresListView(),
          SliverToBoxAdapter(child: Space.bottomSpace)
        ],
      ),
    );
  }
}
