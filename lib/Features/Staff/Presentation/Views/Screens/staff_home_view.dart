import 'package:coffee_oasis/Core/Helpers/space.dart';

import 'package:coffee_oasis/Core/Widgets/backgrounc.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/Views/Widgets/Home%20Widgets/home_header_text.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/Views/Widgets/Home%20Widgets/tabs.dart';
import 'package:coffee_oasis/Features/Staff/Presentation/Views/Widgets/Home%20Widgets/tabs_view.dart';
import 'package:flutter/material.dart';

class StaffHomeView extends StatelessWidget {
  const StaffHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Scaffold(
          body: SafeArea(
            child: Background(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Space.k20,
                    const StaffHomeHeaderText(
                    ),
                    Space.k24,
                    const Tabs(),
                    Space.k24,
                    const TabsView(),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
