import 'package:coffee_oasis/Core/Models/bottom_naivigation_bar_item.dart';
import 'package:coffee_oasis/Core/Widgets/Bottom%20Bar/app_bottom_bar.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/cart_view.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/user_home_view.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return  AppBottomBar(
      useBackGround: false,
      bottomBarItmeModel: [
        BottomBarItemModel(
          icon: EvaIcons.home,
          
          title: 'Home'
        ),
         BottomBarItemModel(
          icon: Icons.shopping_cart_outlined,
          title: 'Cart'
        ),
        BottomBarItemModel(
          icon: EvaIcons.shoppingBag,
          title: 'Orders'
        ),
        BottomBarItemModel(
          icon: EvaIcons.person,
          title: 'Profile'
        )
      ],
      pages: const[
        UserHomeView(),
        CartView(),
        Center(child: Text('Center')),
        Center(child: Text('Center')),
      ],
    );
  }
}