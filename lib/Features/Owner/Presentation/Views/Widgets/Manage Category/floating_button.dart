import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/get_all_categories/get_all_categories_cubit.dart';

import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Manage%20Category/add_form_bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageCategoryFloatingButton extends StatelessWidget {
  const ManageCategoryFloatingButton({super.key, required this.cubit});
  final GetAllCategoriesCubit cubit;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 65,
        height: 65,
        child: FloatingActionButton(
          onPressed: () async {
            showDialog(
                context: context,
                builder: (context) {
                  return BlocProvider.value(
                    value: cubit,
                    child: const ManageCategoryAddFormBlocBrovider(),
                  );
                });
          },
          backgroundColor: AppColors.kPrimaryColor,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            size: 35,
            color: Colors.white,
          ),
        ));
  }
}
