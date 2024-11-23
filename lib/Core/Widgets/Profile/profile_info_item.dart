import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/Profile/edit_profile_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileInfoItem extends StatelessWidget {
  const ProfileInfoItem({
    super.key,
    required this.info,
    required this.title,
    this.onPressed,
    this.editItem,
    this.needIcon,
    this.onSaved,
    this.formKey,
    this.cubit,
  });

  final String title, info;
  final bool? editItem, needIcon;

  final Future<void> Function(Function)? onPressed;
  final void Function(String?)? onSaved;

  final GlobalKey<FormState>? formKey;
  final Cubit? cubit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Fonts.font20_700),
            editItem == null
                ? Text(info, style: Fonts.font16_500)
                : const SizedBox.shrink(),
          ],
        ),
        needIcon == null
            ? editItem == null
                ? IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return BlocProvider.value(
                                value: cubit!,
                                child: EditFieldBody(
                                    formKey: formKey!,
                                    labelText: info,
                                    onSaved: onSaved!,
                                    onPressed: onPressed!));
                          });
                    },
                    icon: const Icon(Icons.edit))
                : const Icon(Icons.arrow_forward_ios_sharp)
            : const SizedBox.shrink()
      ],
    );
  }
}
