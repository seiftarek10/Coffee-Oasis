import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/coffee_photo_buttton.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Manage%20Category/text_fields.dart';
import 'package:flutter/material.dart';

class ManageCategoryForm extends StatelessWidget {
  const ManageCategoryForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height * 0.7),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Space.topPageSpace,
              const CoffeeDtrinkPhoto(),
              Space.topPageSpace,
              const CategoryTextFieldsAndButton(),
              Space.bottomSpace
            ],
          ),
        ),
      ),
    );
  }
}
