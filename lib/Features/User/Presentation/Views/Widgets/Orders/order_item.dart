import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/coffee_photo_card.dart';
import 'package:coffee_oasis/Core/Widgets/coffee_name_category.dart';
import 'package:coffee_oasis/Core/Widgets/app_clip_rect.dart';
import 'package:coffee_oasis/Core/Widgets/white_container.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/order_item_entity.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Orders/order_state_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.order});
  final OrderItemEntity order;
  @override
  Widget build(BuildContext context) {
    return AppWhiteContainer(
        noPadding: true,
        child: Stack(
          children: [
            Positioned(
                top: 10.h,
                right: 10.w,
                child: Text(
                  DateFormat.Md().add_Hm().format(
                      DateTime.parse(order.date ?? DateTime.now().toString())),
                  style: Fonts.font14_500,
                )),
            Row(children: [
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            ]),
          ],
        ));
  }
}
