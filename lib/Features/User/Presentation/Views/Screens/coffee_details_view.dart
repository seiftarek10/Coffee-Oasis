import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Coffee%20Detils%20%20View%20Widgtss/bottom_section.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Coffee%20Detils%20%20View%20Widgtss/coffee_details_appbar.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Coffee%20Detils%20%20View%20Widgtss/coffee_photo_name.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Coffee%20Detils%20%20View%20Widgtss/counter_widget.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Coffee%20Detils%20%20View%20Widgtss/description.dart';
import 'package:coffee_oasis/Features/User/Presentation/Views/Widgets/Coffee%20Detils%20%20View%20Widgtss/recived_option.dart';
import 'package:flutter/material.dart';

class CoffeeDetailsView extends StatelessWidget {
  const CoffeeDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const DetailsViewBottomSection(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Space.k20,
                const CoffeeDetailsAppBar(),
                Space.k24,
                const CoffeePhotoAndName(),
                const Divider(height: 32),
                const Description(),
                const Divider(height: 22),
                const CounterWidget(),
                const Divider(height: 22),
                const RecivedOptions(),
                Space.k24
              ],
            ),
          ),
        ),
      ),
    );
  }
}
