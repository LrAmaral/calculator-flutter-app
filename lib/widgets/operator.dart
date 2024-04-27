import 'package:flutter/material.dart';

class Operator extends StatelessWidget{
  final VoidCallback? onPressed;
  final String op;
  final TextStyle? style;

  const Operator({
    Key? key,
    this.onPressed,
    required this.op,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      op,
      style: style,
    );
  }
}