import 'package:coffee_oasis/Core/Widgets/States%20Widgets/circular_indicator.dart';
import 'package:coffee_oasis/Core/Widgets/States%20Widgets/empty_widget.dart';
import 'package:coffee_oasis/Core/Widgets/States%20Widgets/error_widget.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/order_entity.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Get%20My%20Orders/get_my_orders_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Orders/orders_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetMyOrdersBlocBuilder extends StatelessWidget {
  const GetMyOrdersBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMyOrdersCubit, GetMyOrdersState>(
        builder: (context, state) {
      if (state is GetMyOrdersSuccess) {
        return _buildSuccessBody(state.orders);
      } else if (state is GetMyOrdersFailure) {
        return _buildErrorBody(context, state.errMessage);
      } else {
        return _buildLoadingBody();
      }
    });
  }

  Widget _buildSuccessBody(List<OrderEntity> orders) {
    if (orders.isEmpty) {
      return const SliverToBoxAdapter(child: AppEmptyWidget(height: 0.6));
    }
    return OrdersListView(
      orders: orders,
    );
  }

  Widget _buildErrorBody(BuildContext context, String message) {
    return SliverToBoxAdapter(
      child: AppErrorWidget(
          onTap: () {
            context.read<GetMyOrdersCubit>().getMyOrders();
          },
          text: '$message Try,again'),
    );
  }

  Widget _buildLoadingBody() {
    return const SliverToBoxAdapter(child: AppCircularIndicator(height: 0.6));
  }
}
