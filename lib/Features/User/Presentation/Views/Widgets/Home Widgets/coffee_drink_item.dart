import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/coffee_photo_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserHomeCoffeeDrinkItem extends StatelessWidget {
  const UserHomeCoffeeDrinkItem({
    super.key,
    required this.coffeeEntity,
    required this.onPreessed,
  });

  final CoffeeEntity coffeeEntity;
  final void Function() onPreessed;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Column(
        children: [
          Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: CoffeePhotoCard(
                  aspectRatio: 140 / 100,
                  photo: coffeeEntity.photo,
                ),
              )),
          SizedBox(height: 5.h),
          Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 3,
                        child: Text(coffeeEntity.name ?? 'No Name',
                            style: Fonts.font18_700)),
                    const SizedBox(height: 4),
                    Expanded(
                      flex: 3,
                      child: Text(coffeeEntity.category ?? '',
                          style: Fonts.font14_500
                              .copyWith(color: Colors.grey[600])),
                    ),
                    Expanded(
                      flex: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 10,
                              child: Text(r'$' '${coffeeEntity.price}',
                                  style: Fonts.font20_700)),
                          Expanded(
                            flex: 4,
                            child: IconButton(
                                onPressed: onPreessed,
                                padding: EdgeInsets.zero,
                                icon: Container(
                                    padding: const EdgeInsets.all(8),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: AppColors.kPrimaryColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Icon(
                                      Icons.add,
                                      size: 20.h,
                                      color: Colors.white,
                                    ))),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 5.h),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
