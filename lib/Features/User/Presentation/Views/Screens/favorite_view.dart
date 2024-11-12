import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Services/get_it.dart';
import 'package:coffee_oasis/Core/Widgets/backgrounc.dart';
import 'package:coffee_oasis/Features/User/Data/Repos/user_repo_impl.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/get_favorite_coffee.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/handle_fav_coffee_use_case.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/is_favorite_item_use_case.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Get%20Favorite%20Coffee/get_favorites_coffee_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Handle%20Favoirtes%20Coffee/handle_favorite_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Favorite/Bloc%20Widgets/get_fav_coffee_bloc_builder.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Favorite/favorite_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetFavoritesCoffeeCubit(
              GetFavoriteCoffeeUseCase(getIt.get<UserRepoImpl>()))
            ..getFavCoffee(),
        ),
        BlocProvider(
            create: (context) => HandleFavoriteCubit(
                HandleFavCoffeeUseCase(getIt.get<UserRepoImpl>()),
                IsFavoriteItemUseCase(getIt.get<UserRepoImpl>()))
              ..initialFavCoffee()),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Background(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        SliverToBoxAdapter(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                              Space.k40,
                              const FavoriteHeader(),
                              Space.k40,
                            ])),
                        const GetFavCoffeeBlocBuilder()
                      ]))),
        ),
      ),
    );
  }
}
