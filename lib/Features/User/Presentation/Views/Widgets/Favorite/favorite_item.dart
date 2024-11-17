import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Core/Widgets/app_clip_rect.dart';
import 'package:coffee_oasis/Core/Widgets/coffee_photo_card.dart';
import 'package:coffee_oasis/Core/Widgets/coffee_name_category.dart';
import 'package:coffee_oasis/Core/Widgets/white_container.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Favorite/clickable_fav_icon.dart';
import 'package:flutter/material.dart';

class FavoriteItem extends StatelessWidget {
  const FavoriteItem({
    super.key,
    required this.coffee,
    required this.tag,
  });
  final CoffeeEntity coffee;
  final String tag;

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
              child: Hero(
                tag: coffee.id!,
                child: CoffeePhotoCard(
                  aspectRatio: 1,
                  photo: coffee.photo,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 7,
            child: TitleAndSubTitleCaffeeCard(
              title: coffee.name ?? 'No Name',
              subTitle: coffee.category ?? 'No Category',
            ),
          ),
          Expanded(flex: 3, child: ClickableFavIcon(coffee: coffee)),
        ],
      ),
    );
  }
}
