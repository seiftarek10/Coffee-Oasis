import 'package:coffee_oasis/Core/%20SharedEnitity/user_order_entity.dart';
import 'package:coffee_oasis/Core/Widgets/States%20Widgets/circular_indicator.dart';
import 'package:coffee_oasis/Core/Widgets/States%20Widgets/empty_widget.dart';
import 'package:coffee_oasis/Core/Widgets/States%20Widgets/error_widget.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/View%20Model/Cubits/Get%20All%20Orders/staff_get_all_orders_cubit.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/Views/Widgets/Home%20Widgets/pick_up_orders_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetPickUpBlocBuilder extends StatelessWidget {
  const GetPickUpBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StaffGetAllOrdersCubit, StaffGetAllOrdersState>(
      builder: (context, state) {
        if (state is StaffGetAllPickUpOrdersSuccess) {
          return _buildSuccessBody(state.orders);
        } else if (state is StaffGetAllOrdersFailure) {
          return _buildErrorBody(context);
        } else {
          return _buildLoadingBody();
        }
      },
    );
  }

  Widget _buildSuccessBody(List<UserOrderEntity> orders) {
    if (orders.isEmpty) {
      return const AppEmptyWidget(height: 0.6);
    }
    return PickUpOrdersListView(orders: orders);
  }

  Widget _buildErrorBody(BuildContext context) {
    return AppErrorWidget(
        height: 0.6,
        onTap: () {
          BlocProvider.of<StaffGetAllOrdersCubit>(context)
              .getAllOrders(isDelivery: false);
        },
        text: 'some Thing Is Wrong');
  }

  Widget _buildLoadingBody() {
    return const AppCircularIndicator(height: 0.6);
  }
}
