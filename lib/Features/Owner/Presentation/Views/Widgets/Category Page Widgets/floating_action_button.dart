import 'package:coffee_oasis/Core/Theme/colors.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Category%20Page%20Widgets/add_coffee_form.dart';
import 'package:flutter/material.dart';

class AddFloatingActionButton extends StatelessWidget {
  const AddFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 65,
      height: 65,
      child: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return const AddCoffeeDrinkForm();
              });
        },
        backgroundColor: AppColors.kPrimaryColor,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          size: 35,
          color: Colors.white,
        ),
      ),
    );
  }
}
