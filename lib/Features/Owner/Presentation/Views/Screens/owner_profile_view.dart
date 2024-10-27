import 'package:coffee_oasis/Core/Services/get_it.dart';
import 'package:coffee_oasis/Features/Owner/Data/Repos/owner_repo_impl.dart';
import 'package:coffee_oasis/Features/Owner/Domain/Use%20Case/get_shop_info_use_case.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/View%20Model/Cubits/get_shop_info/get_shop_info_cubit.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Profile/Bloc%20Widgets/owner_profile_view_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OwnerProfileView extends StatelessWidget {
  const OwnerProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            GetShopInfoCubit(GetShopInfoUseCase(getIt.get<OwnerRepoImpl>()))
              ..getShopInfo(),
        child: Builder(
          builder: (context) {
            return OwnerProfileBlocBuilder(
              getShopInfoCubit: context.read<GetShopInfoCubit>(),
            );
          }
        ));
  }
}

