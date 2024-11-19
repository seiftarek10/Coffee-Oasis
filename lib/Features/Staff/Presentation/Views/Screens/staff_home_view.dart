import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Services/get_it.dart';

import 'package:coffee_oasis/Core/Widgets/backgrounc.dart';
import 'package:coffee_oasis/Features/Staff/Data/Repo/staff_repo_impl.dart';
import 'package:coffee_oasis/Features/Staff/Domain/Use%20Cases/get_all_order_use_case.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/View%20Model/Cubits/Get%20All%20Orders/staff_get_all_orders_cubit.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/Views/Widgets/Home%20Widgets/home_header.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/Views/Widgets/Home%20Widgets/tabs.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/Views/Widgets/Home%20Widgets/tabs_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StaffHomeView extends StatelessWidget {
  const StaffHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StaffGetAllOrdersCubit(
          StaffGetAllOrdersUseCase(getIt.get<StaffRepoImpl>()))
        ..getAllOrders(isDelivery: false),
      child: DefaultTabController(
          length: 2,
          initialIndex: 0,
          child: Scaffold(
            body: SafeArea(
              child: Background(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Space.k20,
                      const StaffHomeHeader(),
                      Space.k24,
                      const Tabs(),
                      Space.k24,
                      const TabsView(),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
