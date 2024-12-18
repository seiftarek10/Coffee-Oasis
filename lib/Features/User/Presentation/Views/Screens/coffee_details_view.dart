import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Services/get_it.dart';
import 'package:coffee_oasis/Features/User/Data/Repos/user_repo_impl.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/order_item_entity.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/handle_fav_coffee_use_case.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/is_favorite_item_use_case.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Handle%20Favoirtes%20Coffee/handle_favorite_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Get%20Cart%20Items/get_cart_items_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Coffee%20Details%20%20View%20Widgtss/bottom_bar.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Coffee%20Details%20%20View%20Widgtss/coffee_details_appbar.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Coffee%20Details%20%20View%20Widgtss/coffee_photo_name.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Coffee%20Details%20%20View%20Widgtss/counter_widget.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Coffee%20Details%20%20View%20Widgtss/description.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Coffee%20Details%20%20View%20Widgtss/recived_way.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoffeeDetailsView extends StatefulWidget {
  const CoffeeDetailsView(
      {super.key,
      required this.orderEntity,
      this.getCartItemsCubit,
      required this.fromCartView});

  final OrderItemEntity orderEntity;
  final GetCartItemsCubit? getCartItemsCubit;
  final bool fromCartView;

  @override
  State<CoffeeDetailsView> createState() => _CoffeeDetailsViewState();
}

class _CoffeeDetailsViewState extends State<CoffeeDetailsView> {
  late OrderItemEntity makedOrder;

  @override
  void initState() {
    super.initState();
    makedOrder = widget.orderEntity;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => HandleFavoriteCubit(
                HandleFavCoffeeUseCase(getIt.get<UserRepoImpl>()),
                IsFavoriteItemUseCase(getIt.get<UserRepoImpl>()))
              ..isFavoriteCoffee(id: widget.orderEntity.coffee.id!)),
      ],
      child: Scaffold(
          bottomNavigationBar: widget.fromCartView
              ? BlocProvider.value(
                  value: widget.getCartItemsCubit!,
                  child: DetailsViewBottomBar(
                    fromCartView: true,
                    order: makedOrder,
                  ),
                )
              : DetailsViewBottomBar(
                  order: makedOrder,
                  fromCartView: false,
                ),
          body: SafeArea(
              child: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Space.k20,
                            CoffeeDetailsAppBar(
                              coffee: widget.orderEntity.coffee,
                            ),
                            Space.k24,
                            CoffeePhotoAndName(
                              tag: widget.orderEntity.coffee.id ?? '',
                              orderEntity: widget.orderEntity,
                            ),
                            const Divider(height: 32),
                            Description(
                              description:
                                  widget.orderEntity.coffee.description ??
                                      'Coffee Drink',
                            ),
                            const Divider(height: 22),
                            CounterWidget(
                                counter: widget.orderEntity.counter,
                                counterNotifier: (counter) {
                                  setState(() {
                                    makedOrder = OrderItemEntity(
                                        counter: counter,
                                        price: counter *
                                            (widget.orderEntity.coffee.price ??
                                                0),
                                        coffee: widget.orderEntity.coffee);
                                  });
                                }),
                            const Divider(height: 22),
                            RecivedOptions(isDelivery: (reciptWay) {
                              makedOrder.isDelivery = reciptWay;
                            }),
                            Space.k24
                          ]))))),
    );
  }
}
