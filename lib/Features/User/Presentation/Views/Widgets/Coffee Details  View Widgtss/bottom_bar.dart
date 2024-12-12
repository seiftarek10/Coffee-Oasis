import 'package:coffee_oasis/Core/%20SharedEnitity/coffee_entity.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/user_order_entity.dart';
import 'package:coffee_oasis/Core/Services/get_it.dart';
import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/app_button.dart';
import 'package:coffee_oasis/Core/%20SharedEnitity/order_item_entity.dart';
import 'package:coffee_oasis/Features/User/Data/Repos/user_repo_impl.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/make_order_use_case.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/payment_stripe_use_case.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Get%20User%20Info/get_user_info_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Make%20Order/make_order_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Coffee%20Details%20%20View%20Widgtss/payment_option_sheet_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsViewBottomBar extends StatelessWidget {
  const DetailsViewBottomBar({
    super.key,
    required this.order,
    required this.fromCartView,
  });
  final OrderItemEntity order;
  final bool fromCartView;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            offset: Offset(0, -0.7),
            blurRadius: 1,
            color: Color.fromARGB(255, 241, 241, 241),
            blurStyle: BlurStyle.inner,
            spreadRadius: 2)
      ]),
      height: 90.h,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Price', style: Fonts.font16_500),
                Text(
                    r'$ '
                    "${order.price ?? 0}",
                    style: Fonts.font18_700
                        .copyWith(color: AppColors.kPrimaryColor)),
              ],
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
            flex: 3,
            child: SizedBox(
              height: 50.h,
              child: Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: AppButton(
                    onPressed: (trigger) async {
                      // trigger();
                      UserOrderEntity preparedOrder = _finalOrder();

                      // trigger();
                      showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.white,
                          builder: (context) {
                            return BlocProvider(
                              create: (context) => MakeOrderCubit(
                                  MakeOrderUseCase(getIt.get<UserRepoImpl>()),
                                  PaymentByStripeUseCase(
                                      getIt.get<UserRepoImpl>())),
                              child: PaymentOptionsBottomSheetBody(
                                order: preparedOrder,
                                fromCartView: fromCartView,
                              ),
                            );
                          });
                    },
                    backgroundColor: AppColors.kPrimaryColor,
                    title: 'Order Now',
                    titleColor: Colors.white,
                    squareShape: true,
                    radius: 18,
                  )),
            ),
          )
        ],
      ),
    );
  }

  UserOrderEntity _finalOrder() {
    return UserOrderEntity(coffee: [
      OrderItemEntity(
          price: order.price ?? 0,
          counter: order.counter,
          isDelivery: order.isDelivery,
          isFinished: false,
          coffee: CoffeeEntity(
              id: order.coffee.id,
              category: order.coffee.category,
              description: order.coffee.description,
              name: order.coffee.name,
              photo: order.coffee.photo,
              price: order.coffee.price ?? 0))
    ], user: GetUserInfoCubit.user);
  }
}
