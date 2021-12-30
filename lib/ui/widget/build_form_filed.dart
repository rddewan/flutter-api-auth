import 'package:flutter/material.dart';
import 'package:login_register/util/email_validator.dart';

buildTextFormFiled(String hint, String lable, TextEditingController controller) => TextFormField(
  controller: controller,
  obscureText: true,
  obscuringCharacter: '*',
  keyboardType: TextInputType.visiblePassword,
  validator: (value) {
    if (value!.isEmpty) {
      return "This field can't be empty.";
    }
  },
  decoration: InputDecoration(
      hintText: hint, labelText: lable, border: const OutlineInputBorder()),
);

buildPasswordFormFiled(String hint, String lable,TextEditingController controller) => TextFormField(
  controller: controller,
  obscureText: true,
  obscuringCharacter: '*',
  keyboardType: TextInputType.visiblePassword,
  validator: (value) {
    if (value!.isEmpty) {
      return "This field can't be empty.";
    }
    else if (value.length < 8) {
      return 'Password length must be 8 or more char';
    }
  },
  decoration: InputDecoration(
      hintText: hint, labelText: lable, border: const OutlineInputBorder()),
);

buildEmailFormFiled(String hint, String lable,TextEditingController controller) => TextFormField(
  controller: controller,
  keyboardType: TextInputType.emailAddress,  
  validator: (value) {
    if (!isValidEmail(value)) {
      return "Email is not valid";
    }
  },
  decoration: InputDecoration(
      hintText: hint, labelText: lable, border: const OutlineInputBorder()),
);
