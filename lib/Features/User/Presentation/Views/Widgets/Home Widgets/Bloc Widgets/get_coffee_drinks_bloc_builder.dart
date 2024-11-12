import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Widgets/States%20Widgets/empty_widget.dart';
import 'package:coffee_oasis/Core/Widgets/States%20Widgets/error_widget.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Get%20Coffee%20Drinks/user_get_coffee_drink_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Home%20Widgets/coffee_drink_item.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Home%20Widgets/coffee_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserGetCoffeeDrinksBlocBuilder extends StatelessWidget {
  const UserGetCoffeeDrinksBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserGetCoffeeDrinkCubit, UserGetCoffeeDrinkState>(
        builder: (context, state) {
      if (state is UserGetCoffeeDrinkSuccess) {
        return _buildSuccessWidget(state.coffee);
      } else if (state is UserGetCoffeeDrinkFailure) {
        return _buildErrorWidget(context, state.errMessage);
      } else {
        return _buildLoadingWidget();
      }
    });
  }

  Widget _buildSuccessWidget(List<CoffeeEntity> coffee) {
    if (coffee.isEmpty) {
      return const SliverToBoxAdapter(child: AppEmptyWidget(height: 1));
    }
    return UserHomeCoffeeDrinksListView(
      coffeeDrinks: coffee,
    );
  }

  Widget _buildErrorWidget(BuildContext context, String message) {
    return SliverToBoxAdapter(
        child: AppErrorWidget(
            height: 0.3,
            color: AppColors.kPrimaryColor,
            onTap: () {
              BlocProvider.of<UserGetCoffeeDrinkCubit>(context)
                  .getCoffeeDrinks();
            },
            text: '$message Try,Again'));
  }

  Widget _buildLoadingWidget() {
    return SliverToBoxAdapter(
        child: Skeletonizer(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 170.w / 240.h,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 40,
                    ),
                    itemCount: 4,
                    itemBuilder: ((context, index) {
                      return UserHomeCoffeeDrinkItem(
                        coffeeEntity: CoffeeEntity(),
                        onPreessed: (t) async {},
                      );
                    })))));
  }
}
