import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/category_entity.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/delete_category/delete_category_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/get_all_categories/get_all_categories_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Manage%20Category/Bloc%20Widgets/delete_category_bloc_listner.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Category%20Page%20Widgets/swap_note.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Manage%20Category/categor_card.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Manage%20Category/edit_form_bloc_provider.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/slide_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageAllCategoriesListView extends StatelessWidget {
  const ManageAllCategoriesListView(
      {super.key, required this.categoriesList, required this.cubit});
  final GetAllCategoriesCubit cubit;
  final List<CategoryEntity> categoriesList;
  @override
  Widget build(BuildContext context) {
    return DeleteCategoryBlocListener(
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
                            return BlocProvider.value(
                              value: cubit,
                              child: EditFormBlocProvider(
                                categoryEntity: categoriesList[index],
                              ),
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
