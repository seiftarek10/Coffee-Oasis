import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Widgets/Animation/opacity.dart';
import 'package:coffee_oasis/Core/Widgets/Profile/profile_header.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/shop_info_entity.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Profile/manage_categories_container.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Profile/shop_info_container.dart';
import 'package:flutter/material.dart';

class OwnerProfileBody extends StatelessWidget {
  const OwnerProfileBody({
    super.key, required this.shopInfoEntity,
  });

  final ShopInfoEntity shopInfoEntity;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: AppAnimatedOpacity(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(children: [
                  Space.topPageSpace,
                  const ProfileHeaderContainer(
                    title: 'Seif Tariq',
                    subTitle: 'Owner of the coffee oasis',
                  ),
                  Space.k40,
                   ShopInfoContainer(
                    shopInfoEntity: shopInfoEntity,
                  ),
                  Space.k40,
                  const ManageCategoriesContainer()
                ]))));
  }
}
