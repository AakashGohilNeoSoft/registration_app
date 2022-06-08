import 'package:flutter/material.dart';

class BaseDropDownButton extends StatelessWidget {
  const BaseDropDownButton(
      {Key? key,
      required this.items,
      required this.onChanged,
      required this.value,
      this.validatorFunction})
      : super(key: key);
  final List<String> items;
  final void Function(dynamic)? onChanged;
  final String? value;
  final String? Function(String?)? validatorFunction;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: value,
      validator: validatorFunction,
      items: items.map(buildMenuItems).toList(),
      onChanged: onChanged,
      isExpanded: true,
      decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          )),
    );
  }

  DropdownMenuItem<String> buildMenuItems(String item) {
    return DropdownMenuItem(value: item, child: Text(item));
  }
}
