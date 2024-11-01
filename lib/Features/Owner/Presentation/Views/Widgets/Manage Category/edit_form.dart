import 'dart:io';
import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Constant/images_folders_name.dart';
import 'package:coffee_oasis/Core/NetWork/storage_services.dart';
import 'package:coffee_oasis/Core/Services/get_it.dart';
import 'package:coffee_oasis/Core/Widgets/app_text_field.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/category_entity.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/update_category/update_category_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/coffee_photo_buttton.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/form_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ManageCategoryEditForm extends StatelessWidget {
  const ManageCategoryEditForm({
    super.key,
    required this.categoryEntity,
    required this.index,
  });
  final int index;
  static final GlobalKey<FormState> _key = GlobalKey();
  static File? selectedPhoto;
  static String? updatedName;
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
                      photourl: categoryEntity.photo,
                      pickedPhoto: (coffeePhoto) {
                        selectedPhoto = coffeePhoto;
                      },
                    ),
                    Space.k40,
                    AppTextField(
                      labelText: categoryEntity.name ?? '',
                      onSaved: (value) {
                        updatedName = value!;
                      },
                    ),
                    const SizedBox(height: 40),
                    FormButtons(
                        cancel: () {
                          _resetForm(context);
                        },
                        buttonTitle: 'Edit',
                        onPressed: (loading) async {
                          _key.currentState?.save();
                          if (updatedName!.isEmpty && selectedPhoto == null) {
                            GoRouter.of(context).pop();
                            return;
                          }
                          loading();
                          await _updateCategory(context);
                          loading();
                        })
                  ])),
            )),
      ),
    );
  }

  void _resetForm(BuildContext context) {
    selectedPhoto = null;
    GoRouter.of(context).pop();
  }

  Future<Map<String, dynamic>> _buildBodyRequest() async {
    if (selectedPhoto == null) {
      return {'name': updatedName!};
    }
    if (updatedName!.isEmpty) {
      String? newPhoto = await _getNewUrl();
      return {'name': categoryEntity.name!, 'photo': newPhoto};
    }

    return {};
  }

  Future<void> _updateCategory(BuildContext context) async {
    UpdateCategoryCubit updateCategoryCubit =
        BlocProvider.of<UpdateCategoryCubit>(context);
    final body = await _buildBodyRequest();

    await updateCategoryCubit.updateCategory(
        id: categoryEntity.id!, body: body);
    selectedPhoto = null;
  }

  Future<String?> _getNewUrl() async {
    await getIt.get<StorageService>().deletePhoto(url: categoryEntity.photo);
    String? newPhoto = await getIt.get<StorageService>().uploadPhoto(
        photo: selectedPhoto!, folderName: FoldersName.categoriesImages);
    return newPhoto;
  }
}
