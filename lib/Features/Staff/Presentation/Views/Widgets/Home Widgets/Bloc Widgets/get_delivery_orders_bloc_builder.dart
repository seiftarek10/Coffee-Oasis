import 'package:coffee_oasis/Core/Widgets/States%20Widgets/circular_indicator.dart';
import 'package:coffee_oasis/Core/Widgets/States%20Widgets/empty_widget.dart';
import 'package:coffee_oasis/Core/Widgets/States%20Widgets/error_widget.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/View%20Model/Cubits/Get%20All%20Orders/staff_get_all_orders_cubit.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/Views/Widgets/Home%20Widgets/delivery_order_list_view.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/order_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetDeliveryOrdersBlocBuilder extends StatelessWidget {
  const GetDeliveryOrdersBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StaffGetAllOrdersCubit, StaffGetAllOrdersState>(
        builder: (context, state) {
      if (state is StaffGetAllOrdersSuccess) {
        return _buildSuccessBody(state.orders);
      } else if (state is StaffGetAllOrdersFailure) {
        return _buildErrorBody();
      } else {
        return _buildLoadingBody();
      }
    });
  }

  Widget _buildSuccessBody(List<OrderEntity> orders) {
    if (orders.isEmpty) {
      return const AppEmptyWidget(height: 0.6);
    }
    return const DeliveryOrdersListView();
  }

  Widget _buildErrorBody() {
    return AppErrorWidget(
        height: 0.6, onTap: () {}, text: 'some Thing Is Wrong');
  }

  Widget _buildLoadingBody() {
    return const AppCircularIndicator(height: 0.6);
  }
}
