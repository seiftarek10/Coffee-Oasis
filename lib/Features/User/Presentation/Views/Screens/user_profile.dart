import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Services/get_it.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/Animation/opacity.dart';
import 'package:coffee_oasis/Core/Widgets/backgrounc.dart';
import 'package:coffee_oasis/Features/Auth/Data/Repos/auth_repo_impl.dart';
import 'package:coffee_oasis/Features/Auth/Domain/Use%20Case/sign_out_use_case.dart';
import 'package:coffee_oasis/Features/Auth/Presentation/View%20Models/Cubits/Sign%20Out/sign_out_cubit.dart';
import 'package:coffee_oasis/Features/User/Data/Repos/user_repo_impl.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/get_user_info_use_case.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/get_user_shop_info_use_case.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/update_user_info_use_case.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Get%20User%20Info/get_user_info_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Update%20User%20Info/update_user_info_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/User%20Get%20Shop%20Info/user_get_shop_info_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Profile/Bloc%20Widgets/get_shop_info_bloc_builder.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Profile/Bloc%20Widgets/get_user_info_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                GetUserInfoCubit(GetUserInfoUseCase(getIt.get<UserRepoImpl>()))
                  ..getUserInfo(remoteSource: false),
          ),
          BlocProvider(
            create: (context) => UpdateUserInfoCubit(
                UpdateUserInfoUseCase(getIt.get<UserRepoImpl>())),
          ),
          BlocProvider(
            create: (context) => UserGetShopInfoCubit(
                UserGetShopInfoUseCase(getIt.get<UserRepoImpl>()))
              ..getShopInfo(),
          ),
          BlocProvider(
            create: (context) =>
                SignOutCubit(SignOutUseCase(getIt.get<AuthRepoImpl>())),
          ),
        ],
        child: Background(
            child: SingleChildScrollView(
                child: AppAnimatedOpacity(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(children: [
                          Space.topPageSpace,
                          Builder(builder: (context) {
                            return GetProfileUserInfoBlocBuilder(
                              updateUserInfoCubit:
                                  context.read<UpdateUserInfoCubit>(),
                            );
                          }),
                          Space.k40,
                          const UserGetShopInfoBlocBuilder(),
                          Space.k20,
                          Text('Deveolped By @ Seif Tariq',
                              style: Fonts.font18_700
                                  .copyWith(color: Colors.white)),
                          Space.k20
                        ]))))));
  }
}
