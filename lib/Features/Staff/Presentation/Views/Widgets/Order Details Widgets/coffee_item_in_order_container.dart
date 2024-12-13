import 'package:coffee_oasis/Core/%20SharedEnitity/order_item_entity.dart';
import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/app_clip_rect.dart';
import 'package:coffee_oasis/Core/Widgets/coffee_name_category.dart';
import 'package:coffee_oasis/Core/Widgets/coffee_photo_card.dart';
import 'package:flutter/material.dart';

class CoffeeItemInStaffOrderDetailsContainer extends StatelessWidget {
  const CoffeeItemInStaffOrderDetailsContainer({
    super.key,
    required this.order,
  });

  final OrderItemEntity order;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Expanded(
          flex: 3,
          child: AppClipReact(
              radiusForAll: true,
              child: CoffeePhotoCard(
                aspectRatio: 1,
                photo: order.coffee.photo,
              ))),
      const SizedBox(width: 16),
      Expanded(
          flex: 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleAndSubTitleCaffeeCard(
                title: order.coffee.name ?? 'No Coffee Name',
                subTitle:
                    "Coffee Price: " "${order.coffee.price.toString()}" r" $",
              ),
              Text(
                order.isPaid == true ? 'Paid' : 'Not Paid',
                style: Fonts.font14_500.copyWith(
                    color: order.isPaid == true
                        ? Colors.green
                        : AppColors.kPrimaryColor),
              )
            ],
          )),
      Text(order.counter.toString(), style: Fonts.font18_700)
    ]);
  }
}
