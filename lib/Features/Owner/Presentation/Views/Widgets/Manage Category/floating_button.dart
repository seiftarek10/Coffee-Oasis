  import 'package:coffee_oasis/Core/Theme/colors.dart';
  import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Manage%20Category/form_structure.dart';
  import 'package:flutter/material.dart';

  class ManageCategoryFloatingButton extends StatelessWidget {
    const ManageCategoryFloatingButton({super.key});

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
                  return const ManageCategoryFormStructure();
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
