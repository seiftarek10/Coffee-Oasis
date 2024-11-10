import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/order_entity.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Coffee%20Details%20%20View%20Widgtss/bottom_bar.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Coffee%20Details%20%20View%20Widgtss/coffee_details_appbar.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Coffee%20Details%20%20View%20Widgtss/coffee_photo_name.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Coffee%20Details%20%20View%20Widgtss/counter_widget.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Coffee%20Details%20%20View%20Widgtss/description.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Coffee%20Details%20%20View%20Widgtss/recived_way.dart';
import 'package:flutter/material.dart';

class CoffeeDetailsView extends StatelessWidget {
  const CoffeeDetailsView({super.key, required this.orderEntity});

  final OrderEntity orderEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const DetailsViewBottomBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Space.k20,
                const CoffeeDetailsAppBar(),
                Space.k24,
                CoffeePhotoAndName(
                  orderEntity: orderEntity,
                ),
                const Divider(height: 32),
                Description(
                  description: orderEntity.coffee.description ?? 'Coffee Drink',
                ),
                const Divider(height: 22),
                CounterWidget(
                  counter: orderEntity.counter,
                  counterNotifier: (counter) {},
                ),
                const Divider(height: 22),
                const RecivedOptions(),
                Space.k24
              ],
            ),
          ),
        ),
      ),
    );
  }
}
