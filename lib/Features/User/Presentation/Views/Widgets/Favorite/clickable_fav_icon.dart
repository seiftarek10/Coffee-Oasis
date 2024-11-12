import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Handle%20Favoirtes%20Coffee/handle_favorite_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Common%20Widgets/favorite_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClickableFavIcon extends StatefulWidget {
  const ClickableFavIcon({super.key, required this.coffee});

  final CoffeeEntity coffee;

  @override
  State<ClickableFavIcon> createState() => _ClickableFavIconState();
}

class _ClickableFavIconState extends State<ClickableFavIcon> {
  late bool isFavorite;
  late bool isLoading;

  @override
  void initState() {
    isFavorite = true;
    isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FavoriteIcon(
      isFavorite: isFavorite,
      isLoading: isLoading,
      onPressed: () async {
        setState(() {
          isLoading = true;
        });
        await context
            .read<HandleFavoriteCubit>()
            .handleFavoriteCoffee(coffee: widget.coffee, isExist: isFavorite);
        setState(() {
          isLoading = false;
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
