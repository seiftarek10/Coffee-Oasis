import 'package:coffee_oasis/Core/%20SharedEnitity/category_entity.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Get%20Coffee%20Drinks/user_get_coffee_drink_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Home%20Widgets/category_home_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserHomeCategoriesListView extends StatefulWidget {
  const UserHomeCategoriesListView(
      {super.key, required this.categories, required this.enabled});

  final List<CategoryEntity> categories;
  final bool enabled;

  @override
  State<UserHomeCategoriesListView> createState() =>
      _UserHomeCategoriesListViewState();
}

class _UserHomeCategoriesListViewState
    extends State<UserHomeCategoriesListView> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          height: 45,
          child: Row(
            children: [
              GestureDetector(
                onTap: () async {
                  setState(() {
                    _selectedIndex = 0;
                  });
                  await BlocProvider.of<UserGetCoffeeDrinkCubit>(context)
                      .getCoffeeDrinks();
                },
                child: UserHomeCategoryItem(
                  categoryName: 'All Coffee',
                  isSelected: _selectedIndex == 0,
                ),
              ),
              const SizedBox(width: 6),
              Skeletonizer(
                enabled: widget.enabled,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.categories.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: GestureDetector(
                          onTap: () async {
                            await BlocProvider.of<UserGetCoffeeDrinkCubit>(
                                    context)
                                .getCoffeeDrinks(
                                    id: widget.categories[index].id);
                            setState(() {
                              _selectedIndex = index + 1;
                            });
                          },
                          child: UserHomeCategoryItem(
                            isSelected: _selectedIndex == index + 1,
                            categoryName: widget.categories[index].name,
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
