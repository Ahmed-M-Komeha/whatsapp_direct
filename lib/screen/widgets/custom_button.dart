import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.onPressed,
      required this.title,
      required this.color,
      this.icon});
  final void Function()? onPressed;
  final String title;
  final Color color;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 140,
      height: 40,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: color,
      onPressed: onPressed,
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
