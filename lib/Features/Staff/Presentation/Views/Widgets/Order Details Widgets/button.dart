import 'package:coffee_oasis/Core/%20SharedEnitity/user_order_entity.dart';
import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Widgets/app_button.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/View%20Model/Cubits/Submit%20Order/submit_order_cubit.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/Views/Widgets/Order%20Details%20Widgets/Bloc%20Widgets/submit_order_bloc_listner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StaffOrderDetailsButton extends StatelessWidget {
  const StaffOrderDetailsButton(
      {super.key, required this.isDelivery, required this.userOrder});
  final UserOrderEntity userOrder;
  final bool isDelivery;
  @override
  Widget build(BuildContext context) {
    return SubmitOrderBlocListner(
      child: SizedBox(
        height: 50.h,
        child: AppButton(
            squareShape: true,
            onPressed: (trigger) async {
              trigger();
              await _submitOrder(context);
              trigger();
            },
            title: 'Submit',
            radius: 20,
            titleColor: Colors.white,
            backgroundColor: AppColors.kPrimaryColor),
      ),
    );
  }

  Future<void> _submitOrder(BuildContext context) async {
    if (isDelivery) {
      await BlocProvider.of<SubmitOrderCubit>(context)
          .submitDeliveryOrder(userOrder: userOrder);
    } else {
      await BlocProvider.of<SubmitOrderCubit>(context)
          .submitPickupOrder(userOrder: userOrder);
    }
  }
}
