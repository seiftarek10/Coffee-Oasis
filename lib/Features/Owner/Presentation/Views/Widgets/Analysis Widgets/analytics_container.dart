import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/white_container.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Analysis%20Widgets/analytics_item.dart';
import 'package:flutter/material.dart';

class AnayliticsContainer extends StatelessWidget {
  const AnayliticsContainer({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: Fonts.font35_700White),
        const Expanded(
          child: AppWhiteContainer(
            padding: EdgeInsets.only(left: 20, right: 20, top: 0),
          
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: AnalyticsContainerItem(
                    title: 'Total Sales',
                    info: r'300 $',
                  ),
                ),
                Expanded(
                  child: AnalyticsContainerItem(
                    title: 'Total Orders',
                    info: '70',
                  ),
                ),
                Expanded(
                  child: AnalyticsContainerItem(
                    title: 'Most Requested',
                    info: 'Lattee',
                  ),
                ),
                Expanded(
                  child: AnalyticsContainerItem(
                    title: 'Less Requested',
                    info: 'Tea',
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
