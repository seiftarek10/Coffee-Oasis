import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Core/Helpers/failed_message.dart';
import 'package:coffee_oasis/Core/Helpers/success_message.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Handle%20Favoirtes%20Coffee/handle_favorite_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Coffee%20Details%20%20View%20Widgtss/Bloc%20Widgets/fav_icon_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageFavoriteIconBlocListner extends StatelessWidget {
  const ManageFavoriteIconBlocListner({super.key, required this.coffee});

  final CoffeeEntity coffee;

  @override
  Widget build(BuildContext context) {
    return BlocListener<HandleFavoriteCubit, HandleFavoriteState>(
        listener: (context, state) {
          if (state is AddFavoriteSuccess) {
            successMessage(
                context: context,
                message: 'Added To Your Favorites Coffee',
                backgroundColor: const Color.fromARGB(255, 126, 80, 51));
          } else if (state is HandleFavoriteFailure) {
            failedMessage(context: context, message: state.errMessage);
          } else if (state is DeleteFavoriteSuccess) {
            successMessage(
                context: context,
                message: 'Deleted From Your Favorites Coffee',
                backgroundColor: const Color.fromARGB(255, 126, 80, 51));
          }
        },
        child: FavIconBlocBuilder(
          coffeeEntity: coffee,
        ));
  }
}
