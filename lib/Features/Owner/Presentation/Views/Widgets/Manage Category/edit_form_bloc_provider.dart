import 'package:coffee_oasis/Core/Services/get_it.dart';
import 'package:coffee_oasis/Features/Owner/Data/Repos/owner_repo_impl.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/category_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Use%20Case/update_category_use_case.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/update_category/update_category_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Manage%20Category/Bloc%20Widgets/edit_category_bloc_listner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditFormBlocProvider extends StatelessWidget {
  const EditFormBlocProvider(
      {super.key, required this.categoryEntity, required this.index});

  final CategoryEntity categoryEntity;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateCategoryCubit(
          UpdateCategoryUseCase(getIt.get<OwnerRepoImpl>())),
      child: EditCategoryBlocListner(
        categoryEntity: categoryEntity,
        index: index,
      ),
    );
  }
}
