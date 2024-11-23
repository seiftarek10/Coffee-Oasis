import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Core/Services/get_it.dart';
import 'package:coffee_oasis/Core/Widgets/States%20Widgets/error_widget.dart';

import 'package:coffee_oasis/Features/User/Data/Repos/user_repo_impl.dart';
import 'package:coffee_oasis/Features/User/Domain/Use%20Case/update_user_info_use_case.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Get%20User%20Info/get_user_info_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Update%20User%20Info/update_user_info_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Profile/user_info_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GetProfileUserInfoBlocBuilder extends StatelessWidget {
  const GetProfileUserInfoBlocBuilder(
      {super.key, required this.updateUserInfoCubit});
  final UpdateUserInfoCubit updateUserInfoCubit;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserInfoCubit, GetUserInfoState>(
        builder: (context, state) {
      if (state is GetUserInfoSuccess) {
        return UserInfoContainer(
          userInfo: state.userEntity,
          updateUserInfoCubit: updateUserInfoCubit,
        );
      } else if (state is GetUserInfoFailure) {
        return AppErrorWidget(
            onTap: () async {
              context.read<GetUserInfoCubit>().getUserInfo(remoteSource: true);
            },
            text: ' Try,Again');
      } else {
        return Skeletonizer(
            child: UserInfoContainer(
          userInfo: UserEntity(),
          updateUserInfoCubit: UpdateUserInfoCubit(
            UpdateUserInfoUseCase(getIt.get<UserRepoImpl>()),
          ),
        ));
      }
    });
  }
}
