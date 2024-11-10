import 'package:coffee_oasis/Core/Utils/assets.dart';
import 'package:coffee_oasis/Core/Widgets/coffee_photo_card.dart';
import 'package:coffee_oasis/Core/Widgets/coffee_name_category.dart';
import 'package:coffee_oasis/Core/Widgets/app_clip_rect.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/order_entity.dart';
import 'package:flutter/material.dart';

class CoffeePhotoAndName extends StatelessWidget {
  const CoffeePhotoAndName({
    super.key,
    required this.orderEntity,
  });

  final OrderEntity orderEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppClipReact(
          radiusForAll: true,
          child: CoffeePhotoCard(
            aspectRatio: 327 / 202,
            photo: orderEntity.coffee.photo,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TitleAndSubTitleCaffeeCard(
                title: orderEntity.coffee.name ?? '',
                subTitle: orderEntity.coffee.category ?? '',
              ),
              Image.asset(
                Assets.imagesSuperiority,
                scale: 0.95,
              )
            ],
          ),
        ),
      ],
    );
  }
}
