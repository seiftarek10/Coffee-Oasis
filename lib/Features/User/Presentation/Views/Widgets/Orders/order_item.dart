import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/coffee_photo_card.dart';
import 'package:coffee_oasis/Core/Widgets/coffee_name_category.dart';
import 'package:coffee_oasis/Core/Widgets/app_clip_rect.dart';
import 'package:coffee_oasis/Core/Widgets/white_container.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/order_entity.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Orders/order_state_text.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.order});
  final OrderEntity order;
  @override
  Widget build(BuildContext context) {
    return AppWhiteContainer(
        noPadding: true,
        child: Row(children: [
          Expanded(
              flex: 4,
              child: AppClipReact(
                  radiusForAll: false,
                  child: CoffeePhotoCard(
                    aspectRatio: 1,
                    photo: order.coffee.photo,
                  ))),
          const SizedBox(width: 16),
          Expanded(
              flex: 6,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleAndSubTitleCaffeeCard(
                      title: order.coffee.name ?? 'No Name',
                      subTitle: order.coffee.category ?? 'No Category',
                    ),
                    const SizedBox(height: 4),
                    OrderStateText(
                      isFinished: order.isFinished ?? false,
                      isDelivered: order.isDelivery ?? true,
                    ),
                  ])),
          Expanded(
              flex: 3,
              child: Text(
                order.counter == 1 ? '1 item' : '${order.counter} items',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Fonts.font18_700
                    .copyWith(color: AppColors.kDarkerPrimaryColor),
              ))
        ]));
  }
}
