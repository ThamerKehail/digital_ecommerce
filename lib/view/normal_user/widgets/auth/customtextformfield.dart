// ignore_for_file: file_names

import 'package:ecommerceapp/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final String label;
  final IconData iconData;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?) validator;
  final TextEditingController myController;
  final void Function()? onTapIcon;
  final int? max;
  const CustomTextFormField({
    super.key,
    required this.hint,
    required this.label,
    required this.iconData,
    required this.myController,
    required this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.onTapIcon,
    this.max,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        maxLines: max,
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
        controller: myController,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          label: Container(
            margin: const EdgeInsets.symmetric(horizontal: 9),
            child: Text(
              label,
              style: const TextStyle(color: ColorApp.primaryColor),
            ),
          ),
          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: 14,
          ),
          suffixIcon: InkWell(
            onTap: onTapIcon,
            child: Icon(
              iconData,
              color: ColorApp.primaryColor,
            ),
          ),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            borderSide: BorderSide(color: ColorApp.primaryColor),
          ),
        ),
      ),
    );
  }
}
