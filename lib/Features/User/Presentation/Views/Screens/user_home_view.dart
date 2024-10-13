import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Home%20Widgets/all_categories_list_view.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Home%20Widgets/coffee_list_view.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Home%20Widgets/offer_card.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Home%20Widgets/user_home_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserHomeView extends StatelessWidget {
  const UserHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Stack(
            children: [
              Column(
                children: [
                  const UserHomeHeader(),
                  SizedBox(height: 75.h),
                  const HomeCategoriesListView(),
                  const SizedBox(height: 30),
                ],
              ),
              const OfferCard(),
            ],
          ),
        ),
        const HomeCoffeeDrinksListView(),
      ],
    );
  }
}
