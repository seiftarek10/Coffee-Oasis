import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/coffee_photo_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeCoffeeDrinkItem extends StatelessWidget {
  const HomeCoffeeDrinkItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 3,
      child: Column(
        children: [
          const Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: CoffeePhotoCard(
                  aspectRatio: 140 / 100,
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
                      child: Text('Flat White', style: Fonts.font18_700)),
                    const SizedBox(height: 4),
                    Expanded(
                      flex: 3,
                      child: Text('Espresso',
                          style:
                              Fonts.font14_500.copyWith(color: Colors.grey[600])),
                    ),
                    Expanded(
                      flex: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 7,
                            child: Text(r'$ 4.53', style: Fonts.font20_700)),
                          Expanded(
                            flex: 3,
                            child: IconButton(
                                onPressed: () {},
                              padding: EdgeInsets.zero,
                                icon: Container(
                                    padding: const EdgeInsets.all(8),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: AppColors.kPrimaryColor,
                                        borderRadius: BorderRadius.circular(10)),
                                    child:  Icon(
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
