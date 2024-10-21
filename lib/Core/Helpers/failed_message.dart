import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

ToastificationItem failedMessage(
    {required BuildContext context, required String message}) {
  return toastification.show(
    context: context,
    type: ToastificationType.success,
    style: ToastificationStyle.flat,
    autoCloseDuration: const Duration(seconds: 4),
    title: Text(
      'Failed!',
      style: Fonts.font14_500PrimaryColor.copyWith(color: Colors.white),
    ),
    description: RichText(text: TextSpan(text: message)),
    alignment: Alignment.topCenter,
    direction: TextDirection.ltr,
    animationDuration: const Duration(milliseconds: 300),
    animationBuilder: (context, animation, alignment, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
    icon: const Icon(Icons.close),
    showIcon: true,
    primaryColor: Colors.white,
    backgroundColor: Colors.red,
    foregroundColor: Colors.white,
    borderRadius: BorderRadius.circular(12),
    boxShadow: const [
      BoxShadow(
        color: Color(0x07000000),
        blurRadius: 16,
        offset: Offset(0, 16),
        spreadRadius: 0,
      )
    ],
    showProgressBar: false,
    closeButtonShowType: CloseButtonShowType.onHover,
    closeOnClick: false,
    pauseOnHover: true,
    dragToClose: true,
    applyBlurEffect: true,
  );
}
