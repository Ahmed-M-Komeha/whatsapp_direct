import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      this.controller,
      this.onPressed,
      this.onChanged,
      this.maxLines = 1,
      required this.hintText,
      required this.icon,
      this.keyboardType,
      this.suffixIcon,
      this.validator});
  final TextEditingController? controller;
  final void Function()? onPressed;
  final Function(String)? onChanged;
  final int maxLines;
  final String hintText;
  final IconData icon;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white, fontSize: 17),
      cursorColor: Colors.white,
      validator: validator,
      keyboardType: keyboardType,
      controller: controller,
      onChanged: onChanged,
      maxLines: maxLines,
      decoration: InputDecoration(
          prefixIcon: suffixIcon,
          suffixIcon: IconButton(
            onPressed: onPressed,
            icon: Icon(icon),
          ),
          hintText: hintText,
          filled: true,
          fillColor: Colors.grey.shade900,
          border: const OutlineInputBorder(borderSide: BorderSide.none)),
    );
  }
}
