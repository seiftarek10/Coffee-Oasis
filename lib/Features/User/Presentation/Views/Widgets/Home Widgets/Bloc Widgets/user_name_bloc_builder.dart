import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Get%20User%20Info/get_user_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserNameBlocBuilder extends StatelessWidget {
  const UserNameBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserInfoCubit, GetUserInfoState>(
        builder: (context, state) {
      if (state is GetUserInfoSuccess) {
        return Text(
          state.userEntity.userName ?? '',
          style: Fonts.font20_700.copyWith(color: AppColors.kWhiteObacity),
        );
      } else {
        return const Text('');
      }
    });
  }
}
