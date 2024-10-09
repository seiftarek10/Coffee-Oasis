import 'package:coffee_oasis/Core/Models/bottom_naivigation_bar_item.dart';
import 'package:coffee_oasis/Core/Widgets/Bottom%20Bar/app_bottom_bar.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/analytics_view.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/owner_home_view.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/owner_profile.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class OwnerView extends StatelessWidget {
  const OwnerView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBottomBar(
      useBackGround: true,
      bottomBarItmeModel: <BottomBarItemModel>[
        BottomBarItemModel(title: 'Home', icon: EvaIcons.home),
        BottomBarItemModel(title: 'Analytics', icon: EvaIcons.barChart),
        BottomBarItemModel(title: 'Profile', icon: EvaIcons.person)
      ],
      pages: const [
        OwnerHomeView(),
        AnalyticsView(),
        OwnerProfile(),
      ],
    );
  }
}
