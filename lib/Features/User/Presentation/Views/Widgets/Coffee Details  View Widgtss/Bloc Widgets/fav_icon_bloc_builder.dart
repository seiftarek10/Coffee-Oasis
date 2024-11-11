import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Handle%20Favoirtes%20Coffee/handle_favorite_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Common%20Widgets/favorite_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavIconBlocBuilder extends StatelessWidget {
  const FavIconBlocBuilder({super.key, required this.coffeeEntity});

  final CoffeeEntity coffeeEntity;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HandleFavoriteCubit, HandleFavoriteState>(
        builder: (context, state) {
      if (state is IsExistState) {
        return _buildFavoriteIcon(context, state.isExist);
      } else if (state is AddFavoriteSuccess) {
        return _buildFavoriteIcon(context, true);
      } else if (state is DeleteFavoriteSuccess) {
        return _buildFavoriteIcon(context, false);
      } else {
        return _buildLoadingBody();
      }
    });
  }

  Widget _buildFavoriteIcon(BuildContext context, bool isExist) {
    return FavoriteIcon(
        isFavorite: isExist,
        onPressed: () async {
          await context
              .read<HandleFavoriteCubit>()
              .handleFavoriteCoffee(coffee: coffeeEntity, isExist: isExist);
        });
  }

  Widget _buildLoadingBody() {
    return Padding(
      padding: EdgeInsets.only(right: 12.w, left: 12.w, top: 19.h),
      child: SizedBox(
        height: 17.h,
        width: 17.w,
        child: const Center(
          child: CircularProgressIndicator(color: AppColors.kPrimaryColor),
        ),
      ),
    );
  }
}
