import 'package:flutter/material.dart';

class BaseTextField extends StatelessWidget {
  const BaseTextField(
      {Key? key,
      required this.textEditingController,
      required this.hintText,
      required this.prefixIcon,
      required this.lable,
      this.suffixIcon})
      : super(key: key);
  final TextEditingController textEditingController;
  final String hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final String lable;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        suffixIcon: suffixIcon != null ? Icon(suffixIcon) : const SizedBox(),
        label: Text(lable),
        hintText: hintText,
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        disabledBorder: const OutlineInputBorder(),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
    );
  }
}
