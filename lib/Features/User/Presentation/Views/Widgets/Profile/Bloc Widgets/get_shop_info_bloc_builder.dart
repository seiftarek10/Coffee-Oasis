import 'package:coffee_oasis/Core/%20SharedEnitity/shop_info_entity.dart';
import 'package:coffee_oasis/Core/Widgets/States%20Widgets/error_widget.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/cubit/user_get_shop_info_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Profile/shop_info_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserGetShopInfoBlocBuilder extends StatelessWidget {
  const UserGetShopInfoBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserGetShopInfoCubit, UserGetShopInfoState>(
        builder: (context, state) {
      if (state is UserGetShopInfoSuccss) {
        return UserShopInfoContainer(
          shopInfo: state.shopInfo,
        );
      } else if (state is UserGetShopInfoFailure) {
        return AppErrorWidget(
            height: 0.3,
            onTap: () async {
              context.read<UserGetShopInfoCubit>().getShopInfo();
            },
            text: ' ${state.errMessage} try,again');
      } else {
        return Skeletonizer(
            child: UserShopInfoContainer(
          shopInfo: ShopInfoEntity(),
        ));
      }
    });
  }
}
