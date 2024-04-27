import 'package:flutter/material.dart';
import 'package:calculator/widgets/number.dart';

class Button extends StatelessWidget {
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final String text;
  final TextStyle textStyle;

  const Button({
    Key? key,
    required this.onPressed,
    required this.backgroundColor,
    required this.text,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (text == '0' ? 164 : 72),
      height: 72,
      child: FloatingActionButton(
        backgroundColor: backgroundColor,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(text == '0' ? 28.0 : 36.0),
        ),
        child: Number(
          onPressed: () {},
          text: text,
          style: textStyle,
        ),
      ),
    );
  }
}
