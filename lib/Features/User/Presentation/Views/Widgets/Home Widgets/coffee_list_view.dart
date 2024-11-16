import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Core/Helpers/failed_message.dart';
import 'package:coffee_oasis/Core/Helpers/success_message.dart';
import 'package:coffee_oasis/Core/Routes/routes_keys.dart';
import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Widgets/Extra%20Models/coffee_details_extra.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/order_entity.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Add%20To%20Cart/add_to_cart_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Home%20Widgets/coffee_drink_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class UserHomeCoffeeDrinksListView extends StatelessWidget {
  const UserHomeCoffeeDrinksListView({
    super.key,
    required this.coffeeDrinks,
  });

  final List<CoffeeEntity> coffeeDrinks;

  @override
  Widget build(BuildContext context) {
    num? price;
    String coffeeName = '';
    return BlocListener<AddToCartCubit, AddToCartState>(
        listener: (context, state) {
          if (state is AddToCartSuccess) {
            successMessage(
                context: context,
                message: '1 $coffeeName - EGP $price',
                backgroundColor: AppColors.kPrimaryColor);
          } else if (state is AddToCartFailure) {
            failedMessage(context: context, message: state.errMessage);
          }
        },
        child: SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 170.w / 240.h,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 40,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  return GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(Routes.coffeeDetails,
                            extra: CoffeeDetailsExtra(
                                orderEntity: OrderEntity(
                                    counter: 1,
                                    price: 1 * (coffeeDrinks[index].price ?? 0),
                                    coffee: coffeeDrinks[index]),
                                fromCartView: false));
                      },
                      child: Hero(
                        tag: coffeeDrinks[index].id!,
                        child: UserHomeCoffeeDrinkItem(
                            coffeeEntity: coffeeDrinks[index],
                            onPreessed: (trigger) async {
                              trigger();

                              await BlocProvider.of<AddToCartCubit>(context)
                                  .addToCart(
                                      cartItem: OrderEntity(
                                          counter: 1,
                                          price: coffeeDrinks[index].price,
                                          coffee: coffeeDrinks[index]));

                              price = coffeeDrinks[index].price ?? 0;
                              coffeeName = coffeeDrinks[index].name ?? '';
                              trigger();
                            }),
                      ));
                }, childCount: coffeeDrinks.length))));
  }
}
