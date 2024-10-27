import 'package:coffee_oasis/Core/Widgets/Profile/edit_profile_field.dart';
import 'package:coffee_oasis/Core/Widgets/Profile/profile_info_item.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/update_shop_info/update_shop_info_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileItemController extends StatelessWidget {
  const ProfileItemController(
      {super.key,
      required this.label,
      required this.title,
      required this.onPressed,
      required this.onSaved,
      required this.formKey,
      required this.shopInfoCubit});

  final String label;
  final String title;
  final Future<void> Function(Function) onPressed;
  final void Function(String?) onSaved;

  final GlobalKey<FormState> formKey;
  final UpdateShopInfoCubit shopInfoCubit;
  @override
  Widget build(BuildContext context) {
    return ProfileInfoItem(
        title: title,
        info: label,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return BlocProvider.value(
                    value: shopInfoCubit,
                    child: EditFieldBody(
                        formKey: formKey,
                        labelText: label,
                        onSaved: onSaved,
                        onPressed: onPressed));
              });
        });
  }
}
