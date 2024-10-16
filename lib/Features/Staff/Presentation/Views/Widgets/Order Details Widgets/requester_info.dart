import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';
import 'package:coffee_oasis/Core/Widgets/white_container.dart';
import 'package:flutter/material.dart';

class RequesterInfo extends StatelessWidget {
  const RequesterInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Requster Info', style: Fonts.font24_700.copyWith(color: Colors.white)),
      Space.k8,
      AppWhiteContainer(
          child: Column(children: [
        Row(children: [
          const Icon(Icons.person, size: 28),
          const SizedBox(width: 6),
          Text('Seif Tariq', style: Fonts.font18_700)
        ]),
        Space.k12,
        Row(children: [
          const Icon(Icons.phone, size: 28),
          const SizedBox(width: 6),
          Text('01027870171', style: Fonts.font18_700)
        ])
      ]))
    ]);
  }
}
