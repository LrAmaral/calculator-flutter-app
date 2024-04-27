import 'package:flutter/material.dart';

class Number extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final TextStyle? style;

  const Number({
    Key? key,
    this.onPressed,
    required this.text,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}