import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:flutter/material.dart';

class AnimtaedCircleAvatar extends StatefulWidget {
  const AnimtaedCircleAvatar({
    super.key,
    required this.icon,
  });

  final IconData icon;

  @override
  State<AnimtaedCircleAvatar> createState() => _AnimtaedCircleAvatarState();
}

class _AnimtaedCircleAvatarState extends State<AnimtaedCircleAvatar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _position;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    _position = Tween<Offset>(begin: const Offset(1.2, 0), end: Offset.zero)
        .animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
        position: _position,
        child: CircleAvatar(
            backgroundColor: AppColors.kPrimaryColor,
            child: Icon(
              widget.icon,
              size: 26,
              color: Colors.white,
            )));
  }
}
