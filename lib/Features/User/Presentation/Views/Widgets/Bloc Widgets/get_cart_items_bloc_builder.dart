import 'package:coffee_oasis/Core/Widgets/States%20Widgets/empty_widget.dart';
import 'package:coffee_oasis/Core/Widgets/States%20Widgets/error_widget.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Get%20Cart%20Items/get_cart_items_cubit.dart';
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
          if (state.cartItems.isEmpty) {
            return const SliverToBoxAdapter(
                child: AppEmptyWidget(
              height: 0.55,
            ));
          }
          return CartItemListView(
            cartItems: state.cartItems,
          );
        } else if (state is GetCartItemsFailure) {
          return SliverToBoxAdapter(
              child: _centerWidget(
            context,
            AppErrorWidget(
                onTap: () async {
                  await BlocProvider.of<GetCartItemsCubit>(context)
                      .getCartItems();
                },
                text: 'Try,Again'),
          ));
        } else {
          return SliverToBoxAdapter(
            child: _centerWidget(
                context,
                const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                )),
          );
        }
      },
    );
  }

  Widget _centerWidget(BuildContext context, Widget child) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: MediaQuery.sizeOf(context).height * 0.55,
      ),
      child: child,
    );
  }
}
