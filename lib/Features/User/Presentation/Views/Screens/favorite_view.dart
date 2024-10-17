import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Widgets/backgrounc.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Favorite/favorite_app_bar.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Favorite/favortie_list_view.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Background(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            Space.k20,
                            const FavoriteHeader(),
                            Space.k40,
                          ])),
                      const FavortieListView()
                    ]))),
      ),
    );
  }
}
