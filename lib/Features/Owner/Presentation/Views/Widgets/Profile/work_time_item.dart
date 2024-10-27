import 'package:coffee_oasis/Core/Widgets/Profile/profile_info_item.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/shop_info_entity.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/update_shop_info/update_shop_info_cubit.dart';
import 'package:coffee_oasis/Core/Extension/null_or_empty.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/edit_work_time_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WorkTimeItem extends StatelessWidget {
  const WorkTimeItem({
    super.key,
    required this.shopInfoCubit,
    required this.shopInfoEntity,
  });

  final ShopInfoEntity shopInfoEntity;
  static final String? label;
  static final String? title;
  static final Future<void> Function(Function)? onPressed;
  static final void Function(String?)? onSavedEndTime, onSavedStartTime;
  static String? _startTime, _endTime, _endAmOrPm, _startAmOrPm;

  static final GlobalKey<FormState> formKey = GlobalKey();
  final UpdateShopInfoCubit shopInfoCubit;
  // static final ValueChanged<String> startTimeAmOrPm,endTimeAmOrPm;
  @override
  Widget build(BuildContext context) {
    return ProfileInfoItem(
        title: 'Work Time',
        // info: label,
        info: 'From ${shopInfoEntity.startTime} To ${shopInfoEntity.endTime}',
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return BlocProvider.value(
                    value: shopInfoCubit,
                    child: EditWorkTimeBody(
                        formKey: formKey,
                        startTime: shopInfoEntity.startTime ?? '',
                        endTime: shopInfoEntity.endTime ?? '',
                        onSavedStartTime: (value) {
                          _startTime = value;
                        },
                        onSavedEndTime: (value) {
                          _endTime = value;
                        },
                        endTimeAmOrPm: (value) {
                          _endAmOrPm = value;
                        },
                        startTimeAmOrPm: (value) {
                          _startAmOrPm = value;
                        },
                        onPressed: (trigger) async {
                          formKey.currentState!.save();
                          if (_validationForm(context, _endTime, _startTime)) {
                            return;
                          }
                          trigger();
                          await _update(context, _buildWorkTimeBody());
                          trigger();
                        }));
              });
        });
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

  Map<String, dynamic> _buildWorkTimeBody() {
    Map<String, dynamic> body = {};
    if (!_startTime.isNullOrEmpty) {
      body['startTime'] = "$_startTime ${_startAmOrPm ?? 'AM'}";
    }
    if (!_endTime.isNullOrEmpty) {
      body['endTime'] = "$_endTime ${_endAmOrPm ?? 'AM'}";
    }
    return body;
  }
}
