import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Core/Widgets/States%20Widgets/circular_indicator.dart';
import 'package:coffee_oasis/Core/Widgets/States%20Widgets/empty_widget.dart';
import 'package:coffee_oasis/Core/Widgets/States%20Widgets/error_widget.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Get%20Favorite%20Coffee/get_favorites_coffee_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Favorite/favortie_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetFavCoffeeBlocBuilder extends StatelessWidget {
  const GetFavCoffeeBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavoritesCoffeeCubit, GetFavoritesCoffeeState>(
        builder: (context, state) {
      if (state is GetFavoritesCoffeeSuccess) {
        return _buildSuccessBody(state.favCoffee);
      } else if (state is GetFavoritesCoffeeFailure) {
        return _buildErrorBody(context, state.errMeassage);
      } else {
        return _buildLoadingBody();
      }
    });
  }

  Widget _buildSuccessBody(List<CoffeeEntity> favCoffee) {
    if (favCoffee.isEmpty) {
      return const SliverToBoxAdapter(child: AppEmptyWidget(height: 0.6));
    }
    return FavortieListView(
      favCoffee: favCoffee,
    );
  }

  Widget _buildErrorBody(BuildContext context, String errMessage) {
    return SliverToBoxAdapter(
      child: AppErrorWidget(
          onTap: () {
            context.read<GetFavoritesCoffeeCubit>().getFavCoffee();
          },
          text: '$errMessage Try,again'),
    );
  }

  Widget _buildLoadingBody() {
    return const SliverToBoxAdapter(child: AppCircularIndicator(height: 0.6));
  }
}
