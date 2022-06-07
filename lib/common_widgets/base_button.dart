import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  const BaseButton(
      {Key? key, required this.buttonText, required this.onPressed})
      : super(key: key);
  final String buttonText;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        child: Text(buttonText),
      ),
    );
  }
}
