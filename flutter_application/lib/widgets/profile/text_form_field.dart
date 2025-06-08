import 'package:flutter/material.dart';

class ProfileTextFormField extends StatelessWidget {

  final String label ;
  // callback function to handle the saved value can be added if needed
  final Function(String) onSaved;
  final String initialValue;
  final bool validator;
   const ProfileTextFormField({super.key, required this.label, required this.onSaved, required this.initialValue, required this.validator});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:  InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        labelText: label,
      ),
      validator:validator? (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $label';
        }
        return null;
      }:null,
      onSaved: (value) {
        if (value != null) {
          onSaved(value);
        }
      },
      keyboardType: label == 'Email' ? TextInputType.emailAddress : TextInputType.text,
      textInputAction: TextInputAction.next,
      style: const TextStyle(fontSize: 16, color: Colors.black),
      cursorColor: Colors.black,
      cursorHeight: 20,
      cursorWidth: 1.5,
      initialValue: initialValue,
    );
  }
}