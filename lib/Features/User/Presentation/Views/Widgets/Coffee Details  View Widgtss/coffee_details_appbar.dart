import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/arrow_back.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Coffee%20Details%20%20View%20Widgtss/Bloc%20Widgets/fav_icon_bloc_builder.dart';
import 'package:flutter/material.dart';

class CoffeeDetailsAppBar extends StatelessWidget {
  const CoffeeDetailsAppBar({
    super.key,
    required this.coffee,
  });

  final CoffeeEntity coffee;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const ArrowBackIcon(
          color: Colors.black,
        ),
        const Spacer(),
        Text('Details', textAlign: TextAlign.center, style: Fonts.font20_700),
        const Spacer(),
        FavIconBlocBuilder(
          coffeeEntity: coffee,
        )
      ],
    );
  }
}
