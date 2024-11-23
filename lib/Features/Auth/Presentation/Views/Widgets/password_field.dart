import 'package:coffee_oasis/Core/Helpers/validation_form.dart';
import 'package:coffee_oasis/Core/Widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    required this.onSaved,
  });

  final void Function(String?) onSaved;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  late bool isvisable;

  @override
  void initState() {
    isvisable = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
        labelText: 'Password',
        obsecureText: !isvisable,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              isvisable = !isvisable;
            });
          },
          icon: Icon(isvisable ? Icons.visibility : Icons.visibility_off),
          color: Colors.white,
        ),
        validator: (password) {
          return ValidationForm.validPassword(password);
        },
        onSaved: widget.onSaved);
  }
}
