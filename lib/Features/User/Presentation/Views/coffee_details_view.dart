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
    return const Scaffold(
      bottomNavigationBar: DetailsViewBottomSection(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 24),
                CoffeeDetailsAppBar(),
                SizedBox(height: 24),
                CoffeePhotoAndName(),
                Divider(height: 32),
                Description(),
                Divider(height: 22),
                CounterWidget(),
                Divider(height: 22),
                RecivedOptions()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
