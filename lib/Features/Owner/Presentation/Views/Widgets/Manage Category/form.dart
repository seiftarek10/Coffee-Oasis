import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Helpers/validation_form.dart';
import 'package:coffee_oasis/Core/Widgets/app_text_field.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/category_entity.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/add_category/add_category_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/coffee_photo_buttton.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/form_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageCategoryForm extends StatelessWidget {
  const ManageCategoryForm({super.key, required this.isLoading});

  static String name = '';
 
  final bool isLoading;
  static final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _key,
        child: Column(
          children: [
            CoffeeDtrinkPhoto(
              photo: (photo) {},
            ),
                Space.k40,

            AppTextField(
              labelText: 'Category Name',
              validator: (value) {
                return ValidationForm.nullOrEpmty(value)!;
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
                  if (_key.currentState!.validate()) {
                    _key.currentState!.save();
                    await _addCategoryMethod(context);
                  }
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
