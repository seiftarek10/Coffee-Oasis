import 'package:coffee_oasis/Core/Routes/routes_keys.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/white_container.dart';

import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/edit_field_body.dart';
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
                          onSaved: (v) {},
                        );
                      });
                },
              ),
              const SizedBox(height: 20),
              ProfileInfoItem(
                title: 'Favorite',
                info: '',
                editItem: false,
                onPressed: () {
                  GoRouter.of(context).push(Routes.favorite);
                },
              ),
              const SizedBox(height: 20),
              ProfileInfoItem(
                title: 'Log Out',
                info: '',
                editItem: false,
                onPressed: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}
