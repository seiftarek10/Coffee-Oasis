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
      Text('Requster Info',
          style: Fonts.font24_700.copyWith(color: Colors.white)),
      Space.k8,
      AppWhiteContainer(
          child: Column(children: [
        _buildRequesterInfoItem(info: 'Seif Tariq', icon: Icons.person),
        Space.k12,
        _buildRequesterInfoItem(info: '01027870171', icon: Icons.phone),
        Space.k12,
        _buildRequesterInfoItem(info: 'Giza', icon: Icons.location_on_rounded),
      ]))
    ]);
  }



  Widget _buildRequesterInfoItem(
      {required String info, required IconData icon}) {
    return Row(children: [
      Icon(icon, size: 28),
      const SizedBox(width: 6),
      Text(info, style: Fonts.font18_700)
    ]);
  }
}
