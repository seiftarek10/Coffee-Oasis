import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Services/get_it.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';

import 'package:coffee_oasis/Core/Widgets/backgrounc.dart';
import 'package:coffee_oasis/Features/User/Data/Repos/user_repo_impl.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/order_item_entity.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/get_user_info_use_case.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Get%20User%20Info/get_user_info_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Order%20Details%20/Bloc%20Widgets/get_contact_user_info.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Order%20Details%20/order_contianer.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Order%20Details%20/order_details_app_bar.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Order%20Details%20/recived_way.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key, required this.order});

  final OrderItemEntity order;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetUserInfoCubit(GetUserInfoUseCase(getIt.get<UserRepoImpl>()))
            ..getUserInfo(remoteSource: false),
      child: Scaffold(
        body: SafeArea(
            child: Background(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Space.topPageSpace,
                  const OrderDetailsAppBar(),
                  Space.k40,
                  OrderDetatilsRecivedWay(
                    isDeliverd: order.isDelivery ?? true,
                  ),
                  Space.k40,
                  const GetContactUserInfo(),
                  Space.k40,
                  OrderContainer(
                    order: order,
                  ),
                  Space.k12,
                  Center(
                    child: Text('Deveolped by @ Seif Tariq',
                        style: Fonts.font16_500.copyWith(color: Colors.white)),
                  )
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
