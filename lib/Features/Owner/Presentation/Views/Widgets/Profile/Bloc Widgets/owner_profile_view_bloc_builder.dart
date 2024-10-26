import 'package:coffee_oasis/Core/Widgets/States%20Widgets/error_widget.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/get_shop_info/get_shop_info_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Profile/Bloc%20Widgets/owner_profile_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OwnerProfileBlocBuilder extends StatelessWidget {
  const OwnerProfileBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetShopInfoCubit, GetShopInfoState>(
        builder: (context, state) {
      if (state is GetShopInfoSuccess) {
        return OwnerProfileBody(shopInfoEntity: state.shopInfoEntity);
      } else if (state is GetShopInfoFailure) {
        return AppErrorWidget(
            onTap: () async {
              await context.read<GetShopInfoCubit>().getShopInfo();
            },
            text: state.errMessage);
      } else {
        return const Center(
            child: CircularProgressIndicator(color: Colors.white));
      }
    });
  }
}
