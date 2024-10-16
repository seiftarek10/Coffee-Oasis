import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Core/Theme/fonts.dart';

import 'package:coffee_oasis/Core/Widgets/backgrounc.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Order%20Details%20/contact_container.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Order%20Details%20/order_contianer.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Order%20Details%20/order_details_app_bar.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Order%20Details%20/recived_way.dart';
import 'package:flutter/material.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Background(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Space.topPageSpace,
                const OrderDetailsAppBar(),
                Space.k40,
                const RecivedWay(),
                Space.k40,
                const AddressContainer(),
                Space.k40,
                const OrderContainer(),
                Space.k12,
                Center(
                  child: Text('Deveolped by @Seif Tariq',
                      style: Fonts.font16_500.copyWith(color: Colors.white)),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
