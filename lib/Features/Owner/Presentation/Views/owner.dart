import 'package:coffee_oasis/Core/Models/bottom_naivigation_bar_item.dart';
import 'package:coffee_oasis/Core/Widgets/Bottom%20Bar/app_bottom_bar.dart';
import 'package:flutter/material.dart';

class OwnerHome extends StatelessWidget {
  const OwnerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBottomBar(
      bottomBarItmeModel: <BottomBarItemModel>[
        BottomBarItemModel(title: 'Home', icon: Icons.home),
        BottomBarItemModel(title: 'Home', icon: Icons.home),
        BottomBarItemModel(title: 'Home', icon: Icons.home)
      ],
      pages: const [
        Center(child: Text('Home')),
        Center(child: Text('analytics')),
        Center(child: Text('coffee')),
      ],
    );
  }
}
