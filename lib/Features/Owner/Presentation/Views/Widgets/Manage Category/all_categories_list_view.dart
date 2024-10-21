import 'dart:developer';
import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/category_entity.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Category%20Page%20Widgets/swap_note.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Manage%20Category/categor_card.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Manage%20Category/form.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/slide_card.dart';
import 'package:flutter/material.dart';

class ManageAllCategoriesListView extends StatelessWidget {
  const ManageAllCategoriesListView({super.key, required this.categoriesList});

  final List<CategoryEntity> categoriesList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Space.k24,
          const SwapNote(),
          Space.k24,
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: categoriesList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: SlideCard(
                    delete: () {
                      log('Delete');
                    },
                    update: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const ManageCategoryForm();
                          });
                    },
                    itemKey: Key(index.toString()),
                    child:  ManageCategoryCard(
                      categoryEntity: categoriesList[index],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
