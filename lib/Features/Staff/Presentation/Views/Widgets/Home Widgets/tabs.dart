import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/View%20Model/Cubits/Get%20All%20Orders/staff_get_all_orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Tabs extends StatelessWidget {
  const Tabs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TabBar(
        labelStyle:
            Fonts.font24_700.copyWith(color: AppColors.kDarkerPrimaryColor),
        unselectedLabelStyle: Fonts.font18_700.copyWith(color: Colors.white),
        dividerHeight: 0.0,
        indicator: BoxDecoration(
          color: const Color.fromARGB(132, 0, 0, 0),
          borderRadius: BorderRadius.circular(10),
        ),
        indicatorSize: TabBarIndicatorSize.values[0],
        onTap: (index) {
          if (index == 0) {
            BlocProvider.of<StaffGetAllOrdersCubit>(context)
                .getAllOrders(isDelivery: false);
          } else {
            BlocProvider.of<StaffGetAllOrdersCubit>(context)
                .getAllOrders(isDelivery: true);
          }
        },
        tabs: [
          Text('Pick Up', style: Fonts.font18_700),
          Text('Deliver', style: Fonts.font18_700),
        ],
      ),
    );
  }
}
