import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final String label;
  final String hinttext;
  final int maxLength;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function()? onKeyReturn;
  final TextInputAction textInputAction;
  final bool isReadOnly;
  final bool isEnabled;
  final void Function(String value)? onChanged;

  const TextBox({
    Key? key,
    this.label = 'tec1',
    this.maxLength = 50,
    this.controller,
    this.focusNode,
    this.onKeyReturn,
    this.textInputAction = TextInputAction.done,
    this.isReadOnly = false,
    this.isEnabled = true,
    this.onChanged,
    required this.hinttext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      color: Colors.grey,
      child: TextField(
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        readOnly: isReadOnly,
        enabled: isEnabled,
        textInputAction: textInputAction,
        onSubmitted: (x) {
          onKeyReturn!();
        },
        focusNode: focusNode,
        onChanged: onChanged,
        maxLength: maxLength,
        controller: controller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          prefixText: "",
          counterText: '',
          labelText: label,
          hintText: hinttext,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
