import 'package:coffee_oasis/Core/Routes/routes_keys.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/white_container.dart';

import 'package:coffee_oasis/Core/Widgets/Profile/edit_profile_field.dart';
import 'package:coffee_oasis/Core/Widgets/Profile/profile_info_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserInfoContainer extends StatelessWidget {
  const UserInfoContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('User Info', style: Fonts.font35_700White),
        const SizedBox(height: 10),
        AppWhiteContainer(
          child: Column(
            children: [
              ProfileInfoItem(
                title: 'Email',
                info: 'Seift470@gmail.com',
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return EditFieldBody(
                          labelText: 'seift470@gmail.com',
                          onSaved: (v) {},
                          onPressed: (t) async {},
                          formKey: GlobalKey(),
                        );
                      });
                },
              ),
              const SizedBox(height: 20),
              ProfileInfoItem(
                title: 'phone',
                info: '01027870171',
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return EditFieldBody(
                          labelText: '01027870171',
                          onSaved: (v) {},
                          formKey: GlobalKey(),
                          onPressed: (t) async {},
                        );
                      });
                },
              ),
              const SizedBox(height: 20),
              ProfileInfoItem(
                title: 'Address',
                info: 'Giza',
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return EditFieldBody(
                          labelText: 'Giza',
                          formKey: GlobalKey(),
                          onSaved: (v) {},
                          onPressed: (t) async {},
                        );
                      });
                },
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  GoRouter.of(context).push(Routes.favorite);
                },
                child: const ProfileInfoItem(
                  title: 'Favorite',
                  info: '',
                  editItem: false,
                ),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {},
                child: const ProfileInfoItem(
                  title: 'Log Out',
                  info: '',
                  editItem: false,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
