import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Services/get_it.dart';
import 'package:coffee_oasis/Features/User/Data/Repos/user_repo_impl.dart';
import 'package:coffee_oasis/Features/User/Domain/Entity/order_entity.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/make_order_use_case.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Get%20Cart%20Items/get_cart_items_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Make%20Order/make_order_cubit.dart';
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

  final OrderEntity orderEntity;
  final GetCartItemsCubit? getCartItemsCubit;
  final bool fromCartView;

  @override
  State<CoffeeDetailsView> createState() => _CoffeeDetailsViewState();
}

class _CoffeeDetailsViewState extends State<CoffeeDetailsView> {
  late OrderEntity makedOrder;

  @override
  void initState() {
    super.initState();
    makedOrder = widget.orderEntity;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MakeOrderCubit(MakeOrderUseCase(getIt.get<UserRepoImpl>())),
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
                  const CoffeeDetailsAppBar(),
                  Space.k24,
                  CoffeePhotoAndName(
                    orderEntity: widget.orderEntity,
                  ),
                  const Divider(height: 32),
                  Description(
                    description:
                        widget.orderEntity.coffee.description ?? 'Coffee Drink',
                  ),
                  const Divider(height: 22),
                  CounterWidget(
                    counter: widget.orderEntity.counter,
                    counterNotifier: (counter) {
                      setState(() {
                        makedOrder = OrderEntity(
                            counter: counter,
                            coffee: widget.orderEntity.coffee);
                      });
                    },
                  ),
                  const Divider(height: 22),
                  const RecivedOptions(),
                  Space.k24
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
