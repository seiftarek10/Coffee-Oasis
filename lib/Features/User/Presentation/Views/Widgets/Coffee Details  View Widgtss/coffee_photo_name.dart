import 'package:coffee_oasis/Core/Utils/assets.dart';
import 'package:coffee_oasis/Core/Widgets/coffee_photo_card.dart';
import 'package:coffee_oasis/Core/Widgets/coffee_name_category.dart';
import 'package:coffee_oasis/Core/Widgets/app_clip_rect.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/order_item_entity.dart';
import 'package:flutter/material.dart';

class CoffeePhotoAndName extends StatelessWidget {
  const CoffeePhotoAndName({
    super.key,
    required this.orderEntity,
    required this.tag,
  });

  final OrderItemEntity orderEntity;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppClipReact(
          radiusForAll: true,
          child: Hero(
            tag: tag,
            child: CoffeePhotoCard(
              aspectRatio: 327 / 202,
              photo: orderEntity.coffee.photo,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: TitleAndSubTitleCaffeeCard(
                  title: orderEntity.coffee.name ?? '',
                  subTitle: orderEntity.coffee.category ?? '',
                ),
              ),
              Expanded(
                flex: 2,
                child: Image.asset(
                  Assets.imagesSuperiority,
                  scale: 0.95,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
