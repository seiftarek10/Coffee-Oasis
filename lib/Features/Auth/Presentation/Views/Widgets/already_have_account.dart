import 'package:coffee_oasis/Core/Routes/routes_keys.dart';
import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: "Already have an account yet? ",
            style: Fonts.font16_500.copyWith(color: Colors.white),
            children: <TextSpan>[
          TextSpan(
              text: 'Sign In',
              style: Fonts.font18_700.copyWith(color: AppColors.kPrimaryColor),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  GoRouter.of(context).pushReplacement(Routes.signin);
                })
        ]));
  }
}
