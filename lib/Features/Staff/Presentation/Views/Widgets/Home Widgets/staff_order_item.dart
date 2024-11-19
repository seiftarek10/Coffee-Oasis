import 'package:coffee_oasis/Core/%20SharedEnitity/user_order_entity.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/app_clip_rect.dart';
import 'package:coffee_oasis/Core/Widgets/coffee_photo_card.dart';
import 'package:coffee_oasis/Core/Widgets/coffee_name_category.dart';
import 'package:coffee_oasis/Core/Widgets/white_container.dart';
import 'package:flutter/material.dart';

class StaffOrderItem extends StatefulWidget {
  const StaffOrderItem({
    super.key,
    required this.order,
    required this.isDelivery,
  });
  final UserOrderEntity order;
  final bool isDelivery;

  @override
  State<StaffOrderItem> createState() => _StaffOrderItemState();
}

class _StaffOrderItemState extends State<StaffOrderItem> {
  List<String> coffeeNames = [];
  int length = 0;

  @override
  void initState() {
    for (var coffee in widget.order.coffee!) {
      if (coffee.isDelivery == widget.isDelivery) {
        length += 1;
        coffeeNames.add(coffee.coffee.name ?? '');
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppWhiteContainer(
      noPadding: true,
      child: Row(children: [
        const Expanded(
            flex: 2,
            child: AppClipReact(
                radiusForAll: false, child: CoffeePhotoCard(aspectRatio: 1))),
        const SizedBox(width: 16),
        Expanded(
            flex: 7,
            child: TitleAndSubTitleCaffeeCard(
                title: widget.order.user?.userName ?? 'No Name',
                subTitle: coffeeNames.join(', '))),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Text(length.toString(), style: Fonts.font18_700),
        )
      ]),
    );
  }
}
