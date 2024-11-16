import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/shop_info_entity.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/update_shop_info/update_shop_info_cubit.dart';
import 'package:coffee_oasis/Core/Extension/null_or_empty.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/edit_work_time_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WorkTimeItem extends StatelessWidget {
  const WorkTimeItem({
    super.key,
    required this.updateShopInfoCubit,
    required this.shopInfoEntity,
  });

  final ShopInfoEntity shopInfoEntity;
  final UpdateShopInfoCubit updateShopInfoCubit;
  static String? _startTime, _endTime, _startAmOrPm, _endAmOrPm;

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Work Time', style: Fonts.font20_700),
            Text(
              'From ${shopInfoEntity.startTime} To ${shopInfoEntity.endTime}',
              style: Fonts.font16_500,
            ),
          ],
        ),
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return BlocProvider.value(
                  value: updateShopInfoCubit,
                  child: Builder(builder: (context) {
                    return EditWorkTimeBody(
                      formKey: formKey,
                      startTime: shopInfoEntity.startTime ?? '',
                      endTime: shopInfoEntity.endTime ?? '',
                      onSavedStartTime: (value) => _startTime = value,
                      onSavedEndTime: (value) => _endTime = value,
                      startTimeAmOrPm: (value) => _startAmOrPm = value,
                      endTimeAmOrPm: (value) => _endAmOrPm = value,
                      onPressed: (trigger) async {
                        formKey.currentState?.save();
                        if (_validationForm(context, _endTime, _startTime)) {
                          return;
                        }
                        trigger();
                        await context
                            .read<UpdateShopInfoCubit>()
                            .updateShopInfo(body: _buildWorkTimeBody());
                        trigger();
                      },
                    );
                  }),
                );
              },
            );
          },
          icon: const Icon(Icons.edit),
        ),
      ],
    );
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

bool _validationForm(BuildContext context, String? value,
    [String? secondValue]) {
  if (value.isNullOrEmpty && secondValue.isNullOrEmpty) {
    GoRouter.of(context).pop();
    return true;
  } else {
    return false;
  }
}
