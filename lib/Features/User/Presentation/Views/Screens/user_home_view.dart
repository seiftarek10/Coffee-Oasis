import 'package:coffee_oasis/Core/Services/get_it.dart';
import 'package:coffee_oasis/Features/User/Data/Repos/user_repo_impl.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/add_to_cart_use_case.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/get_all_categoires_use_case.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/get_coffee_drinks_use_case.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/get_user_info_use_case.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Add%20To%20Cart/add_to_cart_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Get%20All%20Categories/user_get_all_categories_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Get%20Coffee%20Drinks/user_get_coffee_drink_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Get%20User%20Info/get_user_info_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Home%20Widgets/Bloc%20Widgets/get_all_categories_bloc_builder.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Home%20Widgets/Bloc%20Widgets/get_coffee_drinks_bloc_builder.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Home%20Widgets/offer_card.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Home%20Widgets/user_home_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserHomeView extends StatelessWidget {
  const UserHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                GetUserInfoCubit(GetUserInfoUseCase(getIt.get<UserRepoImpl>()))
                  ..getUserInfo(remoteSource: false)),
        BlocProvider(
          create: (context) => UserGetAllCategoriesCubit(
              UserGetAllCategoiresUseCase(getIt.get<UserRepoImpl>()))
            ..getAllCategories(),
        ),
        BlocProvider(
            create: (context) => UserGetCoffeeDrinkCubit(
                UserGetCoffeeDrinksUseCase(getIt.get<UserRepoImpl>()))
              ..getCoffeeDrinks()),
        BlocProvider(
          create: (context) =>
              AddToCartCubit(AddToCartUseCase(getIt.get<UserRepoImpl>())),
        )
      ],
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              children: [
                Column(
                  children: [
                    const UserHomeHeader(),
                    SizedBox(height: 85.h),
                    const UserGetAllCategoriesBlocBuilder(),
                    const SizedBox(height: 30),
                  ],
                ),
                const OfferCard(),
              ],
            ),
          ),
          const UserGetCoffeeDrinksBlocBuilder()
        ],
      ),
    );
  }
}
