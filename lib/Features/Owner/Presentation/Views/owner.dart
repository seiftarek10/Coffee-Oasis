import 'package:coffee_oasis/Core/Models/bottom_naivigation_bar_item.dart';
import 'package:coffee_oasis/Core/Widgets/Bottom%20Bar/app_bottom_bar.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/analytics_view.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/owner_home_view.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/owner_profile.dart';
import 'package:flutter/material.dart';

class OwnerView extends StatelessWidget {
  const OwnerView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBottomBar(
      bottomBarItmeModel: <BottomBarItemModel>[
        BottomBarItemModel(title: 'Home', icon: Icons.home),
        BottomBarItemModel(title: 'Analytics', icon: Icons.analytics),
        BottomBarItemModel(title: 'Profile', icon: Icons.person)
      ],
      pages: const [
        OwnerHomeView(),
        AnalyticsView(),
        OwnerProfile(),
      ],
    );
  }
}
