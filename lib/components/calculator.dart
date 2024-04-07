import 'package:flutter/material.dart';

import 'package:calculator/theme/design_system.dart';
import 'package:calculator/components/number.dart';
import 'package:calculator/components/operator.dart';

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              // Container(
              //   width: 100.0,
              // ),
              const SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: SystemColors.lightGray.toColor(),
                child: const Operator(
                  op: 'AC',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: SystemColors.lightGray.toColor(),
                child: const Operator(
                  op: '+/-',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: SystemColors.lightGray.toColor(),
                child: const Operator(
                  op: '%',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: SystemColors.vividGamboge.toColor(),
                child: const Operator(
                  op: '/',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 10,
                height: 10,
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: SystemColors.eerieBlack.toColor(),
                child: Number(
                  onPressed: () {},
                  text: '7',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: SystemColors.eerieBlack.toColor(),
                child: Number(
                  onPressed: () {},
                  text: '8',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: SystemColors.eerieBlack.toColor(),
                child: Number(
                  onPressed: () {},
                  text: '9',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: SystemColors.vividGamboge.toColor(),
                child: Number(
                  onPressed: () {},
                  text: 'x',
                  style: const TextStyle(
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
              const SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: SystemColors.eerieBlack.toColor(),
                child: Number(
                  onPressed: () {},
                  text: '4',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: SystemColors.eerieBlack.toColor(),
                child: Number(
                  onPressed: () {},
                  text: '5',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: SystemColors.eerieBlack.toColor(),
                child: Number(
                  onPressed: () {},
                  text: '6',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: SystemColors.vividGamboge.toColor(),
                child: Number(
                  onPressed: () {},
                  text: '-',
                  style: const TextStyle(
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
              const SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: SystemColors.eerieBlack.toColor(),
                child: Number(
                  onPressed: () {},
                  text: '1',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: SystemColors.eerieBlack.toColor(),
                child: Number(
                  onPressed: () {},
                  text: '2',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: SystemColors.eerieBlack.toColor(),
                child: Number(
                  onPressed: () {},
                  text: '3',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                onPressed: () {},
                backgroundColor: SystemColors.vividGamboge.toColor(),
                child: Number(
                  onPressed: () {},
                  text: '+',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
