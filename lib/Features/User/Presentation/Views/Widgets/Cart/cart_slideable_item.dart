import 'package:coffee_oasis/Core/Constant/value_constant.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/order_item_entity.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Cart/cart_item.dart';
import 'package:flutter/material.dart';

class CartSlideableItem extends StatelessWidget {
  const CartSlideableItem({
    super.key,
    required this.itemKey,
    required this.cartItem,
    required this.delete,
  });

  final Key itemKey;

  final OrderItemEntity cartItem;

  final void Function() delete;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Dismissible(
            direction: DismissDirection.endToStart,
            key: itemKey,
            background: Container(
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius:
                      BorderRadius.circular(AppConstant.kBorderRadius)),
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.endToStart) {
                delete();
              }
              return false;
            },
            child: CartItem(
              cartItemEntity: cartItem,
            )),
        const SizedBox(height: 12),
      ],
    );
  }
}
