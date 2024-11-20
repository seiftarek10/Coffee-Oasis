import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Routes/routes_keys.dart';
import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Widgets/Extra%20Models/coffee_details_extra.dart';
import 'package:coffee_oasis/Core/Widgets/app_button.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/order_item_entity.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Detete%20Cart%20Item/delete_cart_item_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Get%20Cart%20Items/get_cart_items_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Order%20All/order_all_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Cart/cart_slideable_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CartItemListView extends StatelessWidget {
  const CartItemListView({super.key, required this.cartItems});

  final List<OrderItemEntity> cartItems;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cartItems.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(Routes.coffeeDetails,
                      extra: CoffeeDetailsExtra(
                          orderEntity: cartItems[index],
                          fromCartView: true,
                          getCartItemsCubit:
                              context.read<GetCartItemsCubit>()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: CartSlideableItem(
                    itemKey: Key(index.toString()),
                    cartItem: cartItems[index],
                    delete: () async {
                      await _deleteCartItem(context, cartItems[index].id!);
                    },
                  ),
                ),
              );
            },
          ),
        ),
        Space.k20,
        SizedBox(
          width: double.infinity,
          height: 45.h,
          child: AppButton(
              titleColor: Colors.white,
              backgroundColor: AppColors.kPrimaryColor,
              title: 'Order All',
              squareShape: true,
              radius: 15,
              onPressed: (trigger) async {
                trigger();
                await BlocProvider.of<OrderAllCubit>(context).orderAll();
                trigger();
              }),
        ),
        Space.bottomSpace
      ],
    );
  }

  Future<void> _deleteCartItem(BuildContext context, String id) async {
    GetCartItemsCubit getCartItemsCubit =
        BlocProvider.of<GetCartItemsCubit>(context);
    await BlocProvider.of<DeleteCartItemCubit>(context).deleteCartItem(id: id);
    await getCartItemsCubit.getCartItems();
  }
}
