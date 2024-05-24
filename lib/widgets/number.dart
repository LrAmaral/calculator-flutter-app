import 'package:flutter/material.dart';

class Number extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final TextStyle style;

  const Number({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: text == '0' ? Alignment.centerLeft : Alignment.center,
        padding:
            text == '0' ? const EdgeInsets.only(left: 28.0) : EdgeInsets.zero,
        child: Text(
          text,
          style: style,
        ),
      ),
    );
  }
}
