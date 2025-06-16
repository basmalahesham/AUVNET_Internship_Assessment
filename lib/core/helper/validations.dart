import 'package:flutter/cupertino.dart';

String? emailValidator(String? value, BuildContext context) {
  if (value == null || value.trim().isEmpty) {
    return "Please enter your email address";
  }
  var regex = RegExp(r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9]+\.[a-zA-Z0-9-.]+$)");
  if (!regex.hasMatch(value)) {
    return "Enter a valid email address";
  }
  return null;
}

String? passwordValidator(String? value, BuildContext context) {
  if (value == null || value.trim().isEmpty) {
    return "Please enter your password";
  }
  var regex = RegExp(
    r'(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*_]).{8,}',
  );

  if (!regex.hasMatch(value)) {
    return "Your password must be at least 8 characters long\nand include a combination of numbers,\nuppercase and lowercase letters, and special characters (!\$@%).";
  }
  return null;
}

String? confirmPasswordValidator(
  String? value,
  String passwordController,
  BuildContext context,
) {
  if (value == null || value.trim().isEmpty) {
    return "Please enter your confirmation password";
  }
  if (passwordController != value) {
    return "Enter correct password, password not match";
  }
  return null;
}
