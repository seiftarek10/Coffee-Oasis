import 'package:coffee_oasis/Core/Widgets/app_text_field.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/category_entity.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/add_category/add_category_cubit.dart';

import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/form_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryTextFieldsAndButton extends StatelessWidget {
  const CategoryTextFieldsAndButton({super.key, required this.isLoading});

  static String name = '';
  final bool isLoading;
  static final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _key,
        child: Column(
          children: [
            AppTextField(
              labelText: 'Category Name',
              validator: (v) {
                return '';
              },
              onSaved: (value) {
                name = value!;
              },
            ),
            const SizedBox(height: 40),
            FormButtons(
                isLoading: isLoading,
                buttonTitle: 'Add',
                onPressed: () async {
                  _key.currentState!.save();
                  await _addCategoryMethod(context);
                  
                })
          ],
        ));
  }

  Future<void> _addCategoryMethod(BuildContext context) async {
    await BlocProvider.of<AddCategoryCubit>(context).addCategory(
        category:
            CategoryEntity(id: '', name: name, photo: '', coffeeDrinks: []));
  }
}
