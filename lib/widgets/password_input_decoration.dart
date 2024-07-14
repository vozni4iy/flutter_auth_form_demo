import 'package:flutter/material.dart';
import 'input_decoration.dart';

InputDecoration passwordInputDecoration(String labelText, bool isPasswordVisible, VoidCallback onVisibilityToggle) {
  return inputDecoration(labelText).copyWith(
    suffixIcon: IconButton(
      icon: Icon(
        isPasswordVisible ? Icons.visibility : Icons.visibility_off,
      ),
      onPressed: onVisibilityToggle,
    ),
  );
}
