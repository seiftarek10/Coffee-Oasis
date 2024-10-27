import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Services/get_it.dart';
import 'package:coffee_oasis/Core/Widgets/Animation/opacity.dart';
import 'package:coffee_oasis/Core/Widgets/Profile/profile_header.dart';
import 'package:coffee_oasis/Features/Owner/Data/Repos/owner_repo_impl.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Entites/shop_info_entity.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Use%20Case/update_shop_info_use_case.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/get_shop_info/get_shop_info_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/update_shop_info/update_shop_info_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Profile/Bloc%20Widgets/info_container_bloc_listner.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Profile/manage_categories_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OwnerProfileBody extends StatelessWidget {
  const OwnerProfileBody({
    super.key,
    required this.shopInfoEntity,
    required this.getShopInfoCubit,
  });

  final ShopInfoEntity shopInfoEntity;
  final GetShopInfoCubit getShopInfoCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateShopInfoCubit(
          UpdateShopInfoUseCase(getIt.get<OwnerRepoImpl>())),
      child: SingleChildScrollView(
          child: AppAnimatedOpacity(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(children: [
                    Space.topPageSpace,
                    const ProfileHeaderContainer(
                      title: 'Seif Tariq',
                      subTitle: 'Owner of the coffee oasis',
                    ),
                    Space.k40,
                    Builder(builder: (context) {
                      return BlocProvider.value(
                       value:  getShopInfoCubit,
                        child: ShopInfoContainerBlocListner(
                          updateShopInfoCubit:
                              context.read<UpdateShopInfoCubit>(),
                          shopInfoEntity: shopInfoEntity,
                        ),
                      );
                    }),
                    Space.k40,
                    const ManageCategoriesContainer()
                  ])))),
    );
  }
}
