import 'dart:io';
import 'package:coffee_oasis/Core/Helpers/failed_message.dart';
import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Helpers/validation_form.dart';
import 'package:coffee_oasis/Core/NetWork/images_folders_name.dart';
import 'package:coffee_oasis/Core/NetWork/storage_services.dart';
import 'package:coffee_oasis/Core/Services/get_it.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/coffee_entity.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/add_coffee/add_coffee_drink_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/coffee_photo_buttton.dart';
import 'package:coffee_oasis/Core/Widgets/app_text_field.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/form_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddCoffeeDrinkForm extends StatelessWidget {
  const AddCoffeeDrinkForm({super.key, required this.id});

  final String id;
  static File? selectedPhoto;
  static String? coffeeName, description, price;
  static final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ConstrainedBox(
            constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height * 0.8),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Form(
                    key: _key,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CoffeeDtrinkPhoto(pickedPhoto: (photo) {
                            selectedPhoto = photo;
                          }),
                          Space.topPageSpace,
                          AppTextField(
                              labelText: 'Coffee Drink Name',
                              onSaved: (value) {
                                coffeeName = value;
                              },
                              validator: (value) {
                                return ValidationForm.nullOrEpmty(value);
                              }),
                          Space.k40,
                          AppTextField(
                              labelText: 'Description',
                              onSaved: (value) {
                                description = value;
                              },
                              validator: (value) {
                                return ValidationForm.nullOrEpmty(value);
                              }),
                          Space.k40,
                          AppTextField(
                              labelText: 'Price',
                              onSaved: (value) {
                                price = value;
                              },
                              validator: (value) {
                                return ValidationForm.nullOrEpmty(value);
                              }),
                          Space.k40,
                          FormButtons(
                              buttonTitle: 'Add',
                              cancel: () {
                                _resetForm(context);
                              },
                              onPressed: (trigger) async {
                                if (_key.currentState!.validate()) {
                                  _checkFormValidation(context);
                                  trigger();
                                  await _addCoffee(context);
                                  trigger();
                                }
                              }),
                          Space.k20
                        ])))));
  }


  void _resetForm(BuildContext context) {
    selectedPhoto = null;
    GoRouter.of(context).pop();
  }

  void _checkFormValidation(BuildContext context) {
    _key.currentState!.save();
    if (selectedPhoto == null) {
      failedMessage(context: context, message: 'Coffee Photo is Required');
      return;
    }
  }

  Future<void> _addCoffee(BuildContext context) async {
    String? photoUrl = await getIt.get<StorageService>().uploadPhoto(
        photo: selectedPhoto!, folderName: FoldersName.coffeeDrinkImage);
    final CoffeeEntity coffee = CoffeeEntity(
        photo: photoUrl,
        name: coffeeName,
        description: description,
        price: price);
    await BlocProvider.of<AddCoffeeDrinkCubit>(context)
        .addCoffeeDrink(coffee: coffee, docId: id);
    
  }
}
