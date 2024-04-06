import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        focusColor: Colors.transparent,
      ),
      home: const Scaffold(
        backgroundColor: Colors.black,
        body: Calculator(),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _Options();
}


class Number extends StatefulWidget {
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
  State<Number> createState() => _Numbers();
}

class _Options extends State<Calculator> {
  final List<Map<String, String>> numberData = [];

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: null,
                child: Number(
                  onPressed: null,
                  text: '1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: null,
                child: Number(
                  onPressed: null,
                  text: '2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: null,
                child: Number(
                  onPressed: null,
                  text: '3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: null,
                child: Number(
                  onPressed: null,
                  text: '4',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: null,
                child: Number(
                  onPressed: null,
                  text: '5',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: null,
                child: Number(
                  onPressed: null,
                  text: '6',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: null,
                child: Number(
                  onPressed: null,
                  text: '7',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: null,
                child: Number(
                  onPressed: null,
                  text: '8',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: null,
                child: Number(
                  onPressed: null,
                  text: '9',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Numbers extends State<Number> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      child: Text(
        widget.text,
        style: widget.style,
      ),
    );
  }
}
