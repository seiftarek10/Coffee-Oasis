import 'package:coffee_oasis/Core/Utils/assets.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Home%20Widgets/all_categories_list_view.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Home%20Widgets/coffee_list_view.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Home%20Widgets/user_home_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserHomeView extends StatelessWidget {
  const UserHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [

        SliverToBoxAdapter(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                children: [
                  SizedBox(height: 215.h, child: const UserHomeHeader()),
                  SizedBox(height: 75.h),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: HomeCategoriesListView(),
                  ),
                  const SizedBox(height: 30),
                ],
              ),

              Positioned(
                top: 147.h, // Adjust to your desired position
                left: 18,
                right: 18,
                child: Image.asset(
                  Assets.imagesOffer,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),

        const SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          sliver: HomeCoffeeDrinksListView(),
        ),
      ],
    );
  }
}
