import 'package:coffee_oasis/Core/Widgets/States%20Widgets/error_widget.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/get_shop_info/get_shop_info_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Profile/owner_profile_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OwnerProfileBlocBuilder extends StatelessWidget {
  const OwnerProfileBlocBuilder({super.key, required this.getShopInfoCubit});
  final OwnerGetShopInfoCubit getShopInfoCubit;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OwnerGetShopInfoCubit, OwnerGetShopInfoState>(
        builder: (context, state) {
      if (state is OwenrGetShopInfoSuccess) {
        return OwnerProfileBody(
          shopInfoEntity: state.shopInfoEntity,
          getShopInfoCubit: getShopInfoCubit,
        );
      } else if (state is OwnerGetShopInfoFailure) {
        return AppErrorWidget(
            onTap: () async {
              await context
                  .read<OwnerGetShopInfoCubit>()
                  .getShopInfo(remoteSource: true);
            },
            text: state.errMessage);
      } else {
        return const Center(
            child: CircularProgressIndicator(color: Colors.white));
      }
    });
  }
}
