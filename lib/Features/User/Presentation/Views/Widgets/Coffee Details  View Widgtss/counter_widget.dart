import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({
    super.key,
    required this.counterNotifier,
    required this.counter,
  });

  final ValueChanged<int> counterNotifier;
  final int counter;
  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  late int _counter;

  void icreaseCounter() {
    setState(() {
      _counter++;
      widget.counterNotifier(_counter);
    });
  }

  void decreaseCounter() {
    setState(() {
      if (_counter == 1) {
        return;
      }
      _counter--;
      widget.counterNotifier(_counter);
    });
  }

  @override
  void initState() {
    _counter = widget.counter;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Counter', style: Fonts.font20_700.copyWith()),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  decreaseCounter();
                },
                icon: const Icon(
                  EvaIcons.minusCircle,
                  color: AppColors.kPrimaryColor,
                )),
            Text('$_counter', style: Fonts.font20_700),
            IconButton(
                onPressed: () {
                  icreaseCounter();
                },
                icon: const Icon(
                  Icons.add_circle_outlined,
                  color: AppColors.kPrimaryColor,
                )),
          ],
        )
      ],
    );
  }
}
