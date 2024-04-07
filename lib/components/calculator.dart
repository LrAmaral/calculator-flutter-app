import 'package:flutter/material.dart';
import 'package:calculator/theme/design_system.dart';
import 'package:calculator/components/number.dart';

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 38.0),
            child: Text(
              '0',
              style: TextStyle(color: Colors.white, fontSize: 96),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 72,
                height: 72,
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed: () {},
                  backgroundColor: SystemColors.lightGray.toColor(),
                  elevation: 2,
                  child: Number(
                    onPressed: () {},
                    text: 'AC',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 72,
                height: 72,
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed: () {},
                  backgroundColor: SystemColors.lightGray.toColor(),
                  elevation: 2,
                  child: Number(
                    onPressed: () {},
                    text: '+/-',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 72,
                height: 72,
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed: () {},
                  backgroundColor: SystemColors.lightGray.toColor(),
                  elevation: 2,
                  child: Number(
                    onPressed: () {},
                    text: '%',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 72,
                height: 72,
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed: () {},
                  backgroundColor: SystemColors.vividGamboge.toColor(),
                  elevation: 2,
                  child: Number(
                    onPressed: () {},
                    text: '/',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 72,
                height: 72,
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed: () {},
                  backgroundColor: SystemColors.eerieBlack.toColor(),
                  elevation: 2,
                  child: Number(
                    onPressed: () {},
                    text: '7',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 72,
                height: 72,
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed: () {},
                  backgroundColor: SystemColors.eerieBlack.toColor(),
                  elevation: 2,
                  child: Number(
                    onPressed: () {},
                    text: '8',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 72,
                height: 72,
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed: () {},
                  backgroundColor: SystemColors.eerieBlack.toColor(),
                  elevation: 2,
                  child: Number(
                    onPressed: () {},
                    text: '9',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 72,
                height: 72,
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed: () {},
                  backgroundColor: SystemColors.vividGamboge.toColor(),
                  elevation: 2,
                  child: Number(
                    onPressed: () {},
                    text: 'x',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 72,
                height: 72,
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed: () {},
                  backgroundColor: SystemColors.eerieBlack.toColor(),
                  elevation: 2,
                  child: Number(
                    onPressed: () {},
                    text: '4',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 72,
                height: 72,
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed: () {},
                  backgroundColor: SystemColors.eerieBlack.toColor(),
                  elevation: 2,
                  child: Number(
                    onPressed: () {},
                    text: '5',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 72,
                height: 72,
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed: () {},
                  backgroundColor: SystemColors.eerieBlack.toColor(),
                  elevation: 2,
                  child: Number(
                    onPressed: () {},
                    text: '6',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 72,
                height: 72,
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed: () {},
                  backgroundColor: SystemColors.vividGamboge.toColor(),
                  elevation: 2,
                  child: Number(
                    onPressed: () {},
                    text: '-',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 72,
                height: 72,
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed: () {},
                  backgroundColor: SystemColors.eerieBlack.toColor(),
                  elevation: 2,
                  child: Number(
                    onPressed: () {},
                    text: '1',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 72,
                height: 72,
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed: () {},
                  backgroundColor: SystemColors.eerieBlack.toColor(),
                  elevation: 2,
                  child: Number(
                    onPressed: () {},
                    text: '2',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 72,
                height: 72,
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed: () {},
                  backgroundColor: SystemColors.eerieBlack.toColor(),
                  elevation: 2,
                  child: Number(
                    onPressed: () {},
                    text: '3',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 72,
                height: 72,
                child: FloatingActionButton(
                  heroTag: null,
                  onPressed: () {},
                  backgroundColor: SystemColors.vividGamboge.toColor(),
                  elevation: 2,
                  child: Number(
                    onPressed: () {},
                    text: '+',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 164,
                height: 72,
                child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: SystemColors.eerieBlack.toColor(),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Number(
                    onPressed: () {},
                    text: '0',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 72,
                height: 72,
                child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: SystemColors.eerieBlack.toColor(),
                  child: Number(
                    onPressed: () {},
                    text: ',',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 72,
                height: 72,
                child: FloatingActionButton(
                  onPressed: () {},
                  backgroundColor: SystemColors.vividGamboge.toColor(),
                  child: Number(
                    onPressed: () {},
                    text: '=',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          )
        ],
      ),
    );
  }
}
