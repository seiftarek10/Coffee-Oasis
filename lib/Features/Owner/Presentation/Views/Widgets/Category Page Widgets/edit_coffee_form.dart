import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/coffee_photo_buttton.dart';
import 'package:coffee_oasis/Core/Widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class EditCoffeeDrinkForm extends StatelessWidget {
  const EditCoffeeDrinkForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints:
            BoxConstraints(minHeight: MediaQuery.of(context).size.height),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Space.topPageSpace,
               CoffeeDtrinkPhoto(
                pickedPhoto: (photo){},
              ),
              AppTextField(
                labelText: 'Lettee',
                validator: (v) {
                  return '';
                },
                onSaved: (v) {},
              ),
              Space.k40,
              AppTextField(
                labelText: 'Description',
                validator: (v) {
                  return '';
                },
                onSaved: (v) {},
              ),
              Space.k40,
              AppTextField(
                labelText: r'70 $',
                keyboardType: TextInputType.number,
                validator: (v) {
                  return '';
                },
                onSaved: (v) {},
              ),
              Space.k40,
              // FormButtons(buttonTitle: 'Edit', onPressed: () {}),
              Space.k20
            ],
          )),
        ),
      ),
    );
  }
}
