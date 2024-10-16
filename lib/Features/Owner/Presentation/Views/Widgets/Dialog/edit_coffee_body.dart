import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/edit_coffee_form.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/coffee_photo_buttton.dart';
import 'package:flutter/material.dart';

class DialogEditBody extends StatelessWidget {
  const DialogEditBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          
              Space.topPageSpace,
              const CoffeeDtrinkPhoto(),
              Space.topPageSpace,
              const EditCoffeeDrinkForm()
            ],
          ),
        ),
      ),
    );
  }
}





