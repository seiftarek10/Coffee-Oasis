import 'package:coffee_oasis/Core/Helpers/failed_message.dart';
import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Helpers/success_message.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/category_entity.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/delete_category/delete_category_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/get_all_categories/get_all_categories_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Category%20Page%20Widgets/swap_note.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Manage%20Category/categor_card.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Manage%20Category/edit_form.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/slide_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageAllCategoriesListView extends StatelessWidget {
  const ManageAllCategoriesListView({super.key, required this.categoriesList});

  final List<CategoryEntity> categoriesList;
  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteCategoryCubit, DeleteCategoryState>(
      listener: (context, state) async {
        if (state is DeleteCategorySuccess) {
          successMessage(
              context: context, message: 'Category Deleted Successfuly');
          await BlocProvider.of<GetAllCategoriesCubit>(context)
              .getAllCategories();
        } else if (state is DeleteCategoryFailure) {
          failedMessage(context: context, message: state.errMessage);
        }
      },
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
                    delete: () async {
                      await BlocProvider.of<DeleteCategoryCubit>(context)
                          .deleteCategory(
                              id: categoriesList[index].id!,
                              url: categoriesList[index].photo!);
                    },
                    update: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return  ManageCategoryEditForm(
                              categoryEntity: categoriesList[index],
                            );
                          });
                    },
                    itemKey: Key(index.toString()),
                    child: ManageCategoryCard(
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
