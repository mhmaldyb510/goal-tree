import 'package:flutter/material.dart';

class AddNewGoalCustomTextFormField extends StatelessWidget {
  final String? hintText;
  final int? maxLines;
  final Widget? suffixIcon;
  final bool readOnly;
  final void Function()? onTap;
  final TextEditingController? controller;
  const AddNewGoalCustomTextFormField({
    super.key,
    this.hintText,
    this.maxLines,
    this.suffixIcon,
    this.readOnly = false,
    this.onTap,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      onTap: onTap,
      maxLines: maxLines,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        filled: true,
      ),
    );
  }
}
