import 'package:coffee_oasis/Core/Helpers/space.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/coffee_photo_buttton.dart';
import 'package:coffee_oasis/Core/Widgets/app_text_field.dart';
import 'package:coffee_oasis/Features/Owner/Presentation/Views/Widgets/Dialog/form_buttons.dart';
import 'package:flutter/material.dart';

class AddCoffeeDrinkForm extends StatelessWidget {
  const AddCoffeeDrinkForm({
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
               CoffeeDtrinkPhoto(
                pickedPhoto: (photo) {
                  
                },
              ),
              Space.topPageSpace,
              _buildTextField(
                  label: 'Coffee Drink Name',
                  validator: (v) {
                    return '';
                  },
                  value: 15),
              Space.k40,
              _buildTextField(
                  label: 'Description',
                  validator: (v) {
                    return '';
                  },
                  value: 15),
              Space.k40,
              _buildTextField(
                  label: 'Price',
                  validator: (v) {
                    return '';
                  },
                  value: 15),
              Space.k40,
              // FormButtons(
              //   buttonTitle: 'Add',
              //   // onPressed: () {},
              // ), 
              Space.k20
            ],
          )),
        ),
      ),
    );
  }

  Widget _buildTextField(
      {required String label,
      required String Function(String?) validator,
      TextInputType? keyboardType,
      required var value}) {
    return AppTextField(
      labelText: label,
      keyboardType: keyboardType,
      validator: validator,
      onSaved: (val) {
        value = val;
      },
    );
  }
}
