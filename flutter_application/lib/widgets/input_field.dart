import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final String? Function(String?)? validator; // 👈 Add validator field

  const InputField(
      {super.key,
      required this.label,
      this.controller,
      this.keyboardType,
      this.hintText,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.number,
      decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          hintText: hintText),
      validator: validator ??
          (value) {
            if (value == null || value.trim().isEmpty) {
              return 'Enter $label';
            }
            final number = double.tryParse(value);
            if (number == null) {
              return 'Invalid number for $label';
            }
            if (number < 0) {
              return '$label cannot be negative';
            }
            return null;
          },
    );
  }
}
