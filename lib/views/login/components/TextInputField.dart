import 'package:flutter/material.dart';

class TextinputField extends StatelessWidget {
  const TextinputField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.validator,
    required this.keyboardType,
    required this.prefixIcon,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final String? Function(String?) validator;
  final Icon prefixIcon;
  final TextInputType keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      autofocus: false,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black),
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
        ),
        filled: true,
        isDense: true,
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        fillColor: Colors.grey[300],
      ),
      validator: validator,
    );
  }
}
