import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextFormField extends StatelessWidget {
  final String hintText;
  final String? Function(String?) validator;
  final Function(String?)? onSaved;
  final int? maxLength;
  final List<TextInputFormatter>? formatters;
  final TextEditingController? controller;
  final bool isPassword;

  const MyTextFormField({
    Key? key,
    required this.hintText,
    required this.validator,
    required this.onSaved,
    required this.isPassword,
    this.maxLength,
    this.formatters,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: isPassword,
        controller: controller,
        maxLength: maxLength,
        inputFormatters: formatters,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        validator: validator,
        onSaved: onSaved,
      ),
    );
  }
}
