import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Utils/assets.dart';
import 'package:coffee_oasis/Core/Widgets/app_clip_rect.dart';
import 'package:coffee_oasis/Core/Widgets/search_filed.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Get%20Coffee%20Drinks/user_get_coffee_drink_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Home%20Widgets/Bloc%20Widgets/user_name_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class UserHomeHeader extends StatelessWidget {
  const UserHomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 215.h,
      color: const Color(0xff1d1d1d),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hello',
            style: Fonts.font16_500.copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 8),
          const UserNameBlocBuilder(),
          Flexible(
            child: SizedBox(height: 20.h),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 5,
                child: SearchField(
                  title: 'Search With Coffee Name',
                  onChanged: (searchedCoffee) {
                    BlocProvider.of<UserGetCoffeeDrinkCubit>(context)
                        .serachForCoffee(searchedCoffee: searchedCoffee);
                  },
                ),
              ),
              SizedBox(width: 15.w),
              Expanded(
                child: AppClipReact(
                    radiusForAll: true,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: SvgPicture.asset(Assets.imagesFilet),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
