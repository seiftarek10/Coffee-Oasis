import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/constant.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/analytics_item.dart';
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
        Expanded(
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 24),
            decoration: BoxDecoration(
                color: AppColors.kWhiteObacity,
                borderRadius: BorderRadius.circular(AppConstant.kBorderRadius)),
            child: const Column(
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
