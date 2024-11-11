import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Services/get_it.dart';
import 'package:coffee_oasis/Core/Widgets/Animation/opacity.dart';
import 'package:coffee_oasis/Core/Widgets/backgrounc.dart';
import 'package:coffee_oasis/Features/User/Data/Repos/user_repo_impl.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/get_my_orders_use_case.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Get%20My%20Orders/get_my_orders_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Orders/Bloc%20Widgets/get_my_orders_bloc_builder.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Orders/order_header_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserOrdersView extends StatelessWidget {
  const UserOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetMyOrdersCubit(GetMyOrdersUseCase(getIt.get<UserRepoImpl>()))
            ..getMyOrders(),
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
                        const OrderHeader(),
                        Space.k40,
                      ])),
                  const GetMyOrdersBlocBuilder()
                ])),
      )),
    );
  }
}
