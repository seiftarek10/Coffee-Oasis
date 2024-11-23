import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    required this.titleColor,
    required this.backgroundColor,
    required this.title,
    required this.onPressed,
    this.squareShape,
    this.radius,
    this.needCirculartPadding,
  });

  final Color titleColor, backgroundColor;
  final String title;
  final bool? squareShape;
  final bool? needCirculartPadding;
  final double? radius;
  final Future<void> Function(Function toggleLoading) onPressed;

  @override
  // ignore: library_private_types_in_public_api
  _AppButtonState createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _isLoading = false;

  void _toggleLoading() {
    if (mounted) {
      setState(() {
        _isLoading = !_isLoading;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            overlayColor: AppColors.kPrimaryColor,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            backgroundColor: widget.backgroundColor,
            shape: widget.squareShape != null
                ? RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(widget.radius ?? 10))
                : null),
        onPressed: _isLoading
            ? null
            : () async => await widget.onPressed(_toggleLoading),
        child: _isLoading
            ? SizedBox(
                height: 23.h,
                width: 23.w,
                child: Padding(
                  padding: widget.needCirculartPadding == null
                      ? EdgeInsets.zero
                      : const EdgeInsets.all(5.0),
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              )
            : Text(widget.title,
                textAlign: TextAlign.center,
                style: Fonts.font20_700.copyWith(color: widget.titleColor)));
  }
}
