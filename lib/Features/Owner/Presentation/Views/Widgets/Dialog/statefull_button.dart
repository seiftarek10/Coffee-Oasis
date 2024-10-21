import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:flutter/material.dart';

class StatefulDialogButton extends StatefulWidget {
  const StatefulDialogButton({
    super.key,
    required this.titleColor,
    required this.backgroundColor,
    required this.title,
    required this.onPressed,
  });

  final Color titleColor, backgroundColor;
  final String title;
  final Future<void> Function(Function toggleLoading) onPressed;

  @override
  // ignore: library_private_types_in_public_api
  _StatefulDialogButtonState createState() => _StatefulDialogButtonState();
}

class _StatefulDialogButtonState extends State<StatefulDialogButton> {
  bool _isLoading = false;

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        overlayColor: AppColors.kPrimaryColor,
        padding: const EdgeInsets.symmetric(vertical: 10),
        backgroundColor: widget.backgroundColor,
      ),
      onPressed: _isLoading ? null : () async => await widget.onPressed(_toggleLoading),
      child: _isLoading
          ? const CircularProgressIndicator(
              color: Colors.white,
            )
          : Text(
              widget.title,
              style: Fonts.font20_700.copyWith(color: widget.titleColor),
            ),
    );
  }
}
