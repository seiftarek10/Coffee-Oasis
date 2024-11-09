import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Services/get_it.dart';
import 'package:coffee_oasis/Core/Widgets/Animation/opacity.dart';
import 'package:coffee_oasis/Core/Widgets/backgrounc.dart';
import 'package:coffee_oasis/Features/User/Data/Repos/user_repo_impl.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/get_cart_items_use_case.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Get%20Cart%20Items/get_cart_items_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Bloc%20Widgets/get_cart_items_bloc_builder.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Cart/cart_header_text.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Common%20Widgets/delete_note.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetCartItemsCubit(GetCartItemsUseCase(getIt.get<UserRepoImpl>()))
            ..getCartItems(),
      child: Background(
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
                    Space.k20,
                    const CartHeaderPage(),
                    const SizedBox(height: 40),
                    const DeleteNote(),
                    Space.k12
                  ],
                ),
              ),
              const GetCartItemsBlocBuilder()
            ],
          ),
        ),
      )),
    );
  }
}
