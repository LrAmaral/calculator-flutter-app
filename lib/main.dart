import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(40),
              padding: const EdgeInsets.all(40),
              color: Colors.red,
              child: TextButton(
                child: const Text('1'),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
