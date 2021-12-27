import 'package:flutter/material.dart';

class PasswordFormField extends StatelessWidget {
  const PasswordFormField({
    Key? key,
    required this.lableText,
    required this.textController,
  }) : super(key: key);

  final String lableText;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      obscuringCharacter: '*',
      controller: textController,
      decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
          labelText: lableText),
      keyboardType: TextInputType.visiblePassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '$lableText cannot be empty';
        }
        if (value.length < 8) {
          return '$lableText length must be greater then 7 char';
        }
      },
    );
  }
}
