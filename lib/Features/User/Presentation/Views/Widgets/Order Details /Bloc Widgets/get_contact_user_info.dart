import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Get%20User%20Info/get_user_info_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Order%20Details%20/contact_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GetContactUserInfo extends StatelessWidget {
  const GetContactUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserInfoCubit, GetUserInfoState>(
        builder: (context, state) {
      if (state is GetUserInfoSuccess) {
        return UserContactContainer(
          userinfo: state.userEntity,
        );
      } else if (state is GetUserInfoFailure) {
        return UserContactContainer(userinfo: UserEntity());
      } else {
        return Skeletonizer(
            child: UserContactContainer(userinfo: UserEntity()));
      }
    });
  }
}
