import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/analytics_container.dart';
import 'package:flutter/material.dart';

class AnalyticsView extends StatelessWidget {
  const AnalyticsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Space.topPageSpace,
          const Expanded(child: AnayliticsContainer(title: 'Today',

          )),
          Space.bottomSpace,
          const Expanded(
              child: AnayliticsContainer(title: 'All Time',)),
          Space.bottomSpace
        ],
      ),
    );
  }
}


