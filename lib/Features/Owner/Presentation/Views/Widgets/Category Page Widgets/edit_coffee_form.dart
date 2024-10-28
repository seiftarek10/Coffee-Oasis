import 'dart:io';
import 'package:coffee_oasis/Core/Extension/null_or_empty.dart';
import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Helpers/validation_form.dart';
import 'package:coffee_oasis/Core/Constant/images_folders_name.dart';
import 'package:coffee_oasis/Core/NetWork/storage_services.dart';
import 'package:coffee_oasis/Core/Services/get_it.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/coffee_entity.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/update_coffee_drink/update_coffee_drink_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/coffee_photo_buttton.dart';
import 'package:coffee_oasis/Core/Widgets/app_text_field.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/form_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class EditCoffeeDrinkForm extends StatelessWidget {
  const EditCoffeeDrinkForm({
    super.key,
    required this.coffeeEntity,
    required this.id,
  });
  final CoffeeEntity coffeeEntity;
  final String id;
  static File? selectedPhtot;
  static String? newName, newPrice, newDescription;
  static final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height * 0.8),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                    key: _key,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Space.topPageSpace,
                          CoffeeDtrinkPhoto(
                              pickedPhoto: (photo) {
                                selectedPhtot = photo;
                              },
                              photourl: coffeeEntity.photo),
                          Space.k40,
                          AppTextField(
                            labelText: coffeeEntity.name ?? "",
                            validator: (value) {
                              return ValidationForm.nullOrEpmty(value);
                            },
                            onSaved: (value) {
                              newName = value;
                            },
                          ),
                          Space.k40,
                          AppTextField(
                            labelText:
                                coffeeEntity.description ?? 'Coffee Drink',
                            validator: (value) {
                              return ValidationForm.nullOrEpmty(value);
                            },
                            onSaved: (value) {
                              newDescription = value;
                            },
                          ),
                          Space.k40,
                          AppTextField(
                            labelText: '${coffeeEntity.price ?? '0'}' r' $',
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              return ValidationForm.nullOrEpmty(value);
                            },
                            onSaved: (value) {
                              newPrice = value;
                            },
                          ),
                          Space.k40,
                          FormButtons(
                              buttonTitle: 'Edit',
                              cancel: () {
                                _resetForm(context);
                              },
                              onPressed: (trigger) async {
                                _validateInput(context);
                                trigger();
                                await _updateCoffee(context);
                                trigger();
                              }),
                          Space.k20
                        ])))));
  }

  void _resetForm(BuildContext context) {
    GoRouter.of(context).pop();
    selectedPhtot = null;
  }

  void _validateInput(BuildContext context) {
    _key.currentState!.save();
    if (newPrice.isNullOrEmpty &&
        newDescription.isNullOrEmpty &&
        newName.isNullOrEmpty &&
        selectedPhtot == null) {
      GoRouter.of(context).pop();
      return;
    }
  }

  Future<Map<String, dynamic>> _buildUpdatedBody() async {
    final Map<String, dynamic> updatedBody = {};

    if (!newName.isNullOrEmpty) {
      updatedBody['name'] = newName;
    }
    if (!newDescription.isNullOrEmpty) {
      updatedBody['description'] = newDescription;
    }
    if (!newPrice.isNullOrEmpty) {
      updatedBody['price'] = newPrice;
    }
    if (selectedPhtot != null) {
      updatedBody['photo'] = await _getNewUrl();
    }
    return updatedBody;
  }

  Future<String?> _getNewUrl() async {
    await getIt.get<StorageService>().deletePhoto(url: coffeeEntity.photo!);
    return getIt.get<StorageService>().uploadPhoto(
        photo: selectedPhtot!, folderName: FoldersName.coffeeDrinkImage);
  }

  Future<void> _updateCoffee(BuildContext context) async {
    UpdateCoffeeDrinkCubit updateCoffeeDrinkCubit =
        BlocProvider.of<UpdateCoffeeDrinkCubit>(context);
    Map<String, dynamic>? body = await _buildUpdatedBody();
    await updateCoffeeDrinkCubit.updateCoffeeDrink(
        parentDocID: id, docID: coffeeEntity.id!, body: body);
    selectedPhtot = null;
  }
}
