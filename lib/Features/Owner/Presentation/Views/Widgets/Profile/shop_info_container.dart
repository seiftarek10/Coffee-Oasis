import 'package:coffee_oasis/Core/Extension/null_or_empty.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/white_container.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/shop_info_entity.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/update_shop_info/update_shop_info_cubit.dart';
import 'package:coffee_oasis/Core/Widgets/Profile/profile_item_controller.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Profile/work_time_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ShopInfoContainer extends StatelessWidget {
  const ShopInfoContainer({
    super.key,
    required this.shopInfoEntity,
    this.showTextTitle,
    required this.updateShopInfoCubit,
  });

  final ShopInfoEntity shopInfoEntity;
  final bool? showTextTitle;
  static String? _phoneNumber, _location;

  static final GlobalKey<FormState> _phoneFormKey = GlobalKey<FormState>();
  static final GlobalKey<FormState> _locationFormKey = GlobalKey<FormState>();

  final UpdateShopInfoCubit updateShopInfoCubit;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      showTextTitle == null
          ? Text('Shop Info', style: Fonts.font35_700White)
          : const SizedBox.shrink(),
      const SizedBox(height: 10),
      AppWhiteContainer(
          child: Column(children: [
        ProfileItemController(
            label: shopInfoEntity.phoneNumber ?? '',
            title: 'Phone',
            formKey: _phoneFormKey,
            cubit: updateShopInfoCubit,
            onSaved: (value) => _phoneNumber = value,
            onPressed: (trigger) async {
              _phoneFormKey.currentState!.save();
              if (_validationForm(context, _phoneNumber)) {
                return;
              }

              trigger();
              await _update(context, {'phone': _phoneNumber});
              trigger();
            }),
        const SizedBox(height: 20),
        ProfileItemController(
            label: shopInfoEntity.location ?? '',
            title: 'Location',
            formKey: _locationFormKey,
            cubit: updateShopInfoCubit,
            onSaved: (value) => _location = value,
            onPressed: (trigger) async {
              _locationFormKey.currentState!.save();
              if (_validationForm(context, _location)) {
                return;
              }
              trigger();
              await _update(context, {'location': _location});
              trigger();
            }),
        const SizedBox(height: 20),
        WorkTimeItem(
          shopInfoCubit: updateShopInfoCubit,
          shopInfoEntity: shopInfoEntity,
        )
      ]))
    ]);
  }

  Future<void> _update(BuildContext context, Map<String, dynamic> body) async {
    await BlocProvider.of<UpdateShopInfoCubit>(context)
        .updateShopInfo(body: body);
  }

  bool _validationForm(BuildContext context, String? value,
      [String? secondValue]) {
    if (value.isNullOrEmpty && secondValue.isNullOrEmpty) {
      GoRouter.of(context).pop();
      return true;
    } else {
      return false;
    }
  }
}
