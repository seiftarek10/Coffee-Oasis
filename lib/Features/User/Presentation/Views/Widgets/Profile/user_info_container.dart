import 'package:coffee_oasis/Core/%20SharedEnitity/user_entity.dart';
import 'package:coffee_oasis/Core/Helpers/failed_message.dart';
import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Helpers/validation_form.dart';
import 'package:coffee_oasis/Core/Routes/routes_keys.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/Profile/profile_header.dart';
import 'package:coffee_oasis/Core/Widgets/Profile/profile_item_controller.dart';
import 'package:coffee_oasis/Core/Widgets/white_container.dart';
import 'package:coffee_oasis/Core/Extension/null_or_empty.dart';
import 'package:coffee_oasis/Core/Widgets/Profile/profile_info_item.dart';
import 'package:coffee_oasis/Features/User/Presentation/View%20Model/Cubits/Update%20User%20Info/update_user_info_cubit.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Profile/Bloc%20Widgets/update_info_listner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class UserInfoContainer extends StatelessWidget {
  const UserInfoContainer({
    super.key,
    required this.userInfo,
    required this.updateUserInfoCubit,
  });

  final UserEntity userInfo;
  final UpdateUserInfoCubit updateUserInfoCubit;

  static final GlobalKey<FormState> emailKey = GlobalKey();
  static final GlobalKey<FormState> phoneKey = GlobalKey();
  static final GlobalKey<FormState> addressKey = GlobalKey();
  static String? email, phone, address;
  @override
  Widget build(BuildContext context) {
    return UpdateInfoListner(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ProfileHeaderContainer(
          title: userInfo.userName ?? 'No User Name',
          subTitle: 'Valued Coffee Oasis Member',
        ),
        Space.k40,
        Text('User Info', style: Fonts.font35_700White),
        const SizedBox(height: 10),
        AppWhiteContainer(
            child: Column(children: [
          ProfileItemController(
              label: userInfo.email ?? 'No Eamil',
              title: "Eamil",
              onPressed: (trigger) async {
                emailKey.currentState!.save();
                if (_validationForm(context, email)) {
                  return;
                }
                if (_validationEamil(context, email)) {
                  return;
                }

                trigger();
                await _update(context, {'email': email});
                trigger();
              },
              onSaved: (value) {
                email = value;
              },
              formKey: emailKey,
              cubit: updateUserInfoCubit),
          Space.k20,
          ProfileItemController(
              label: userInfo.address ?? 'No Address',
              title: "Address",
              onPressed: (trigger) async {
                addressKey.currentState!.save();
                if (_validationForm(context, address)) {
                  return;
                }
                trigger();
                await _update(context, {'Address': address});
                trigger();
              },
              onSaved: (value) {
                address = value;
              },
              formKey: addressKey,
              cubit: updateUserInfoCubit),
          Space.k20,
          ProfileItemController(
              label: userInfo.phoneNumber ?? 'No Phone',
              title: "Phone",
              onPressed: (trigger) async {
                phoneKey.currentState!.save();
                if (_validationForm(context, phone)) {
                  return;
                }
                if (_validationPhoneNumber(context, phone)) {
                  return;
                }
                trigger();
                await _update(context, {'phoneNumber': phone});
                trigger();
              },
              onSaved: (value) {
                phone = value;
              },
              formKey: phoneKey,
              cubit: updateUserInfoCubit),
          Space.k20,
          GestureDetector(
              onTap: () {
                GoRouter.of(context).push(Routes.favorite);
              },
              child: const ProfileInfoItem(
                title: 'Favorite',
                info: '',
                editItem: false,
              )),
          Space.k20,
          GestureDetector(
              onTap: () {},
              child: const ProfileInfoItem(
                title: 'Log Out',
                info: '',
                editItem: false,
              ))
        ]))
      ]),
    );
  }

  Future<void> _update(BuildContext context, Map<String, dynamic> body) async {
    await BlocProvider.of<UpdateUserInfoCubit>(context)
        .updateUserInfo(body: body);
  }

  bool _validationForm(
    BuildContext context,
    String? value,
  ) {
    if (value.isNullOrEmpty) {
      GoRouter.of(context).pop();
      return true;
    } else {
      return false;
    }
  }

  bool _validationEamil(
    BuildContext context,
    String? value,
  ) {
    if (ValidationForm.validEmail(value) != null) {
      failedMessage(context: context, message: 'Eamil is Un Valid');
      return true;
    } else {
      return false;
    }
  }

  bool _validationPhoneNumber(
    BuildContext context,
    String? value,
  ) {
    if (ValidationForm.validPhoneNumber(value) != null) {
      failedMessage(context: context, message: 'phone Number is Un Valid');
      return true;
    } else {
      return false;
    }
  }
}
