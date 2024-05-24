import 'package:flutter/material.dart';

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
    final bool isZero = text == '0';
    return SizedBox(
      width: isZero ? 164 : 72,
      height: 72,
      child: FloatingActionButton(
        backgroundColor: backgroundColor,
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(isZero ? 28.0 : 36.0),
        ),
        child: Align(
          alignment: isZero ? Alignment.centerLeft : Alignment.center,
          child: Padding(
            padding:
                isZero ? const EdgeInsets.only(left: 28.0) : EdgeInsets.zero,
            child: Text(
              text,
              style: textStyle,
            ),
          ),
        ),
      ),
    );
  }
}
