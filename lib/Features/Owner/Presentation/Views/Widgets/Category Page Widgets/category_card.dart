import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Utils/assets.dart';
import 'package:coffee_oasis/Core/Widgets/app_clip_rect.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/category_entity.dart';
import 'package:coffee_oasis/Core/Widgets/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.categoryEntity,
  });
  final CategoryEntity categoryEntity;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: AppClipReact(
          radiusForAll: true,
          child: GridTile(
              footer: Container(
                color: Colors.white,
                height: 35.h,
                child: Center(
                    child: Text(
                  categoryEntity.name ?? 'No Name',
                  style: Fonts.font18_700,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
              ),
              child: categoryEntity.photo == null
                  ? const Image(
                      image: AssetImage(Assets.imagesCoffeePlaceholder),
                      fit: BoxFit.fill,
                    )
                  : AppCachedNetworkImage(photo: categoryEntity.photo!))),
    );
  }
}
