import 'dart:io';
import 'package:coffee_oasis/Core/Helpers/failed_message.dart';
import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Helpers/validation_form.dart';
import 'package:coffee_oasis/Core/NetWork/folders_name.dart';
import 'package:coffee_oasis/Core/NetWork/storage_services.dart';
import 'package:coffee_oasis/Core/Services/get_it.dart';
import 'package:coffee_oasis/Core/Widgets/app_text_field.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/category_entity.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/add_category/add_category_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/coffee_photo_buttton.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/form_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ManageCategoryAddForm extends StatelessWidget {
  const ManageCategoryAddForm({
    super.key,
  });

  static String name = '';

  static final GlobalKey<FormState> _key = GlobalKey();
  static File? photo;
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _key,
        child: Column(children: [
          CoffeeDtrinkPhoto(
            pickedPhoto: (coffeePhoto) {
              photo = coffeePhoto;
            },
          ),
          Space.k40,
          AppTextField(
            labelText: 'Category Name',
            validator: (value) {
              return ValidationForm.nullOrEpmty(value);
            },
            onSaved: (value) {
              name = value!;
            },
          ),
          const SizedBox(height: 40),
          FormButtons(
              cancel: () {
                photo = null;
                GoRouter.of(context).pop();
              },
              buttonTitle: 'Add',
              onPressed: (loading) async {
                if (_key.currentState!.validate()) {
                  if (photo == null) {
                    failedMessage(
                        context: context, message: 'Coffee Photo Is Required');
                    return;
                  }
                  loading();
                  _key.currentState!.save();
                  await _addCategoryWithPhoto(context);
                  loading();
                }
              })
        ]));
  }

  Future<void> _addCategoryMethod(
      BuildContext context, CategoryEntity category) async {
    await BlocProvider.of<AddCategoryCubit>(context)
        .addCategory(category: category);
  }

  Future<void> _addCategoryWithPhoto(BuildContext context) async {
    StorageService storageService = getIt.get<StorageService>();
    String? photoUrl = await storageService.uploadPhoto(
        photo: photo!, folderName: FoldersName.categoriesImages);
    CategoryEntity category =
        CategoryEntity(name: name, photo: photoUrl);
    await _addCategoryMethod(context, category);
    photo = null;
  }
}
