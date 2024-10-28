import 'package:coffee_oasis/Core/Routes/routes_keys.dart';
import 'package:coffee_oasis/Core/Widgets/Profile/profile_info_item.dart';
import 'package:coffee_oasis/Core/Widgets/white_container.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ManageCategoriesContainer extends StatelessWidget {
  const ManageCategoriesContainer({super.key});
  
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
          GoRouter.of(context).push(Routes.manageCategories);
      },
      child: const AppWhiteContainer(
        child: ProfileInfoItem(
          info: '',
          title: 'Manage Your Categories',
          editItem: false,
        ),
      ),
    );
  }
}
