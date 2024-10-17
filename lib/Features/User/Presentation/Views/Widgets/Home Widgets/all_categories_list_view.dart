import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Home%20Widgets/category_home_item.dart';
import 'package:flutter/material.dart';

class UserHomeCategoriesListView extends StatefulWidget {
  const UserHomeCategoriesListView({super.key});

  @override
  State<UserHomeCategoriesListView> createState() =>
      _UserHomeCategoriesListViewState();
}

class _UserHomeCategoriesListViewState
    extends State<UserHomeCategoriesListView> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
        height: 45,
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  child:
                      UserHomeCategoryItem(isSelected: _selectedIndex == index),
                ),
              );
            }),
      ),
    );
  }
}
