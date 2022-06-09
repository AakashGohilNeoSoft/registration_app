import 'package:flutter/material.dart';

class BaseTextField extends StatefulWidget {
  const BaseTextField(
      {Key? key,
      required this.textEditingController,
      required this.hintText,
      this.prefixIcon,
      required this.lable,
      this.keyboardType,
      this.validatorFunction,
      this.suffixIcon,
      this.maxLength,
      this.wantObscureText = false})
      : super(key: key);
  final TextEditingController textEditingController;
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final String lable;
  final TextInputType? keyboardType;
  final String? Function(String?)? validatorFunction;
  final int? maxLength;
  final bool wantObscureText;

  @override
  State<BaseTextField> createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends State<BaseTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      textInputAction: TextInputAction.next,
      keyboardType: widget.keyboardType ?? TextInputType.name,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : null,
        suffixIcon: widget.suffixIcon != null
            ? GestureDetector(
                onTap: () {
                  if (widget.wantObscureText) {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  }
                },
                child: obscureText == false
                    ? const Icon(Icons.visibility_off)
                    : Icon(widget.suffixIcon),
              )
            : const SizedBox(),
        label: Text(widget.lable),
        hintText: widget.hintText,
        enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        disabledBorder: const OutlineInputBorder(),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      ),
      validator: widget.validatorFunction,
      maxLength: widget.maxLength,
      obscureText: (widget.wantObscureText == false) ? false : obscureText,
    );
  }
}
