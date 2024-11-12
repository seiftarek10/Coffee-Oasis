import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Core/Routes/routes_keys.dart';
import 'package:coffee_oasis/Core/Widgets/Extra%20Models/coffee_details_extra.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/order_entity.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Favorite/favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FavortieListView extends StatelessWidget {
  const FavortieListView({super.key, required this.favCoffee});
  final List<CoffeeEntity> favCoffee;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return GestureDetector(
            onTap: () {
              GoRouter.of(context).push(Routes.coffeeDetails,
                  extra: CoffeeDetailsExtra(
                      orderEntity: OrderEntity(
                          counter: 1,
                          price: favCoffee[index].price,
                          coffee: favCoffee[index]),
                      fromCartView: false));
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: FavoriteItem(
                coffee: favCoffee[index],
              ),
            ),
          );
        },
        childCount: favCoffee.length,
      ),
    );
  }
}
