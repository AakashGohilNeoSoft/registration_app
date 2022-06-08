import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  const BaseButton(
      {Key? key,
      required this.buttonText,
      required this.onPressed,
      required this.width})
      : super(key: key);
  final String buttonText;
  final double width;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: width,
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
