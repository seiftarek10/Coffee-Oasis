import 'package:coffee_oasis/Core/Helpers/failed_message.dart';
import 'package:coffee_oasis/Core/Helpers/success_message.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/shop_info_entity.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/get_shop_info/get_shop_info_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/update_shop_info/update_shop_info_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Profile/shop_info_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ShopInfoContainerBlocListner extends StatelessWidget {
  const ShopInfoContainerBlocListner({
    super.key,
    required this.shopInfoEntity,
    required this.updateShopInfoCubit,
  });
  final ShopInfoEntity shopInfoEntity;
  final UpdateShopInfoCubit updateShopInfoCubit;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateShopInfoCubit, UpdateShopInfoState>(
      listener: (context, state) async {
        if (state is UpdateShopInfoSuccess) {
          GoRouter.of(context).pop();
          successMessage(context: context, message: 'Updated Successfuly');
          await BlocProvider.of<GetShopInfoCubit>(context)
              .getShopInfo(remoteSource: true);
        } else if (state is UpdateShopInfoFailure) {
          failedMessage(context: context, message: state.errMessage);
        }
      },
      child: ShopInfoContainer(
        shopInfoEntity: shopInfoEntity,
        updateShopInfoCubit: updateShopInfoCubit,
      ),
    );
  }
}
