import 'dart:io';
import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Helpers/validation_form.dart';

import 'package:coffee_oasis/Core/Widgets/app_text_field.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/category_entity.dart';

import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/coffee_photo_buttton.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/form_buttons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ManageCategoryEditForm extends StatelessWidget {
  const ManageCategoryEditForm({
    super.key, required this.categoryEntity,
  });

  static final GlobalKey<FormState> _key = GlobalKey();
  static File? photo;
  static String? name;
  final CategoryEntity categoryEntity;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height * 0.7),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Form(
                  key: _key,
                  child: Column(children: [
                    CoffeeDtrinkPhoto(
                      url: categoryEntity.photo,
                      pickedPhoto: (coffeePhoto) {
                        photo = coffeePhoto;
                      },
                    ),
                    Space.k40,
                    AppTextField(
                      labelText: categoryEntity.name??'',
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
                          // if (_key.currentState!.validate()) {
                          //   if (photo == null) {
                          //     failedMessage(
                          //         context: context,
                          //         message: 'Coffee Photo Is Required');
                          //     return;
                          //   }
                          //   loading();
                          //   _key.currentState!.save();
                          //   await _addCategoryWithPhoto(context);
                          //   loading();
                          // }
                        })
                  ])),
            )),
      ),
    );
  }
}
