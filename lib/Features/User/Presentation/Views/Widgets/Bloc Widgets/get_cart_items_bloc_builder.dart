import 'package:coffee_oasis/Core/Widgets/States%20Widgets/circular_indicator.dart';
import 'package:coffee_oasis/Core/Widgets/States%20Widgets/empty_widget.dart';
import 'package:coffee_oasis/Core/Widgets/States%20Widgets/error_widget.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/order_entity.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Get%20Cart%20Items/get_cart_items_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Bloc%20Widgets/order_all_bloc_listner.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Cart/cart_item_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCartItemsBlocBuilder extends StatelessWidget {
  const GetCartItemsBlocBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCartItemsCubit, GetCartItemsState>(
      builder: (context, state) {
        if (state is GetCartItemsSuccess) {
          return _buildSuccessBody(state.cartItems);
        } else if (state is GetCartItemsFailure) {
          return _buildErrorBody(context);
        } else {
          return _buildLoadingBody(context);
        }
      },
    );
  }

  Widget _buildSuccessBody(List<OrderEntity> cartItems) {
    if (cartItems.isEmpty) {
      return const AppEmptyWidget(
        height: 0.55,
      );
    }
    return OrderAllBlocListner(
      child: CartItemListView(
        cartItems: cartItems,
      ),
    );
  }

  Widget _buildErrorBody(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: MediaQuery.sizeOf(context).height * 0.55,
      ),
      child: AppErrorWidget(
          onTap: () async {
            await BlocProvider.of<GetCartItemsCubit>(context).getCartItems();
          },
          text: 'Try,Again'),
    );
  }

  Widget _buildLoadingBody(BuildContext context) {
    return const AppCircularIndicator(height: 0.55);
  }
}
