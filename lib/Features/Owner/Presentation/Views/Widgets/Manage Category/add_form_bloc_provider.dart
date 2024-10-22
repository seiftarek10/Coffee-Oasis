import 'package:coffee_oasis/Core/Services/get_it.dart';
import 'package:coffee_oasis/Features/Owner/Data/Repos/owner_repo_impl.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Use%20Case/add_category_use_case.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/add_category/add_category_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Bloc%20Widgets/add_category_bloc_listner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageCategoryAddFormBlocBrovider extends StatelessWidget {
  const ManageCategoryAddFormBlocBrovider({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCategoryCubit(
          AddCategorUseCase(ownerRepo: getIt.get<OwnerRepoImpl>())),
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height * 0.7),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Center(child: AddCategoryBlocListner()),
          ),
        ),
      ),
    );
  }
}
