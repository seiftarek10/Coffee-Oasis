import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Widgets/Animation/opacity.dart';
import 'package:coffee_oasis/Core/Widgets/backgrounc.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Cart/cart_header.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Cart/cart_item_list_view.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Common%20Widgets/delete_note.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Background(
        child: AppAnimatedOpacity(
          child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Space.k20 ,
                  const CartHeaderPage(),
                  const SizedBox(height: 40),
                  const DeleteNote(),
                  Space.k12
                ],
              ),
            ),
            const CartItemListView()
          ],
                ),
              ),
        ));
  }
}
