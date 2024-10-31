import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/app_clip_rect.dart';
import 'package:coffee_oasis/Core/Widgets/coffee_photo_card.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/category_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ManageCategoryCard extends StatelessWidget {
  const ManageCategoryCard({super.key, required this.categoryEntity});

  final CategoryEntity categoryEntity;
  @override
  Widget build(BuildContext context) {
    return AppClipReact(
      radiusForAll: true,
      child: Container(
        color: AppColors.kWhiteObacity,
        child: Row(
          children: [
            Expanded(
              child: CoffeePhotoCard(
                  aspectRatio: 1.h, photo: categoryEntity.photo),
            ),
            const SizedBox(width: 16),
            Expanded(
              flex: 2,
              child: Text(
                categoryEntity.name ?? 'No Name',
                style: Fonts.font20_700,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}
