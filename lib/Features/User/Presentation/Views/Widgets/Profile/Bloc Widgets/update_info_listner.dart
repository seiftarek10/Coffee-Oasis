import 'package:coffee_oasis/Core/Helpers/failed_message.dart';
import 'package:coffee_oasis/Core/Helpers/success_message.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Get%20User%20Info/get_user_info_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Update%20User%20Info/update_user_info_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UpdateInfoListner extends StatelessWidget {
  const UpdateInfoListner({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateUserInfoCubit, UpdateUserInfoState>(
      listener: (context, state) async {
        if (state is UpdateUserInfoSuccess) {
          GoRouter.of(context).pop();
          successMessage(context: context, message: 'Updated Successfuly');
          await BlocProvider.of<GetUserInfoCubit>(context)
              .getUserInfo(remoteSource: true);
        } else if (state is UpdateUserInfoFailure) {
          failedMessage(context: context, message: state.errMessage);
        }
      },
      child: child,
    );
  }
}
