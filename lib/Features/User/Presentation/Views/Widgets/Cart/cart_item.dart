import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/app_clip_rect.dart';
import 'package:coffee_oasis/Core/Widgets/coffee_photo_card.dart';
import 'package:coffee_oasis/Core/Widgets/coffee_name_category.dart';
import 'package:coffee_oasis/Core/Widgets/white_container.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/cart_item_entity.dart';
import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.cartItemEntity,
  });

  final CartItemEntity cartItemEntity;

  @override
  Widget build(BuildContext context) {
    return AppWhiteContainer(
      noPadding: true,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: AppClipReact(
                radiusForAll: false,
                child: CoffeePhotoCard(
                  aspectRatio: 1,
                  photo: cartItemEntity.coffee.photo,
                )),
          ),
          const SizedBox(width: 16),
          Expanded(
              flex: 7,
              child: TitleAndSubTitleCaffeeCard(
                title: cartItemEntity.coffee.name ?? 'No Name',
                subTitle: cartItemEntity.coffee.category ?? 'No Category',
              )),
          Expanded(
            flex: 3,
            child: Text(
              cartItemEntity.counter == 1
                  ? '1 item'
                  : '${cartItemEntity.counter} items',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Fonts.font18_700
                  .copyWith(color: AppColors.kDarkerPrimaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
