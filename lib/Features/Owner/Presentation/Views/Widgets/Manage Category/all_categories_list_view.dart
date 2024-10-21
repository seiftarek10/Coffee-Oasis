import 'dart:developer';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Manage%20Category/categor_card.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Manage%20Category/form_structure.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/slide_card.dart';
import 'package:flutter/material.dart';

class ManageAllCategoriesListView extends StatelessWidget {
  const ManageAllCategoriesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 10,
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
                      return const ManageCategoryFormStructure();
                    });
              },
              itemKey: Key(index.toString()),
              child: const ManageCategoryCard(),
            ),
          );
        },
      ),
    );
  }
}
