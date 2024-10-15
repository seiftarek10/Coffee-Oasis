import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/app_clip_rect.dart';
import 'package:coffee_oasis/Core/Widgets/coffee_name_category.dart';
import 'package:coffee_oasis/Core/Widgets/coffee_photo_card.dart';
import 'package:coffee_oasis/Core/Widgets/white_container.dart';
import 'package:flutter/material.dart';

class StaffOrderContainer extends StatelessWidget {
  const StaffOrderContainer({super.key, required this.deliver});

  final bool deliver;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Order info',
            style: Fonts.font24_700.copyWith(color: Colors.white)),
        Space.k8,
        AppWhiteContainer(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              Row(children: [
                const Expanded(
                    flex: 2,
                    child: AppClipReact(
                        radiusForAll: true,
                        child: CoffeePhotoCard(aspectRatio: 1))),
                const SizedBox(width: 16),
                const Expanded(flex: 7, child: TitleAndSubTitleCaffeeCard()),
                Text('1', style: Fonts.font18_700)
              ]),

              deliver?
              Column(
                children: [
                  const Divider(height: 30),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery :',
                          style: Fonts.font18_700,
                        ),
                        Text(
                          'Tamim',
                          style: Fonts.font18_700,
                        )
                      ]),
                ],
              ):
              const SizedBox.shrink()
            ],
          ),
        ),
      ],
    );
  }
}
