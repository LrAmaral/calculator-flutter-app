import 'package:lucasamaral_bt3013758/widgets/button.dart';
import 'package:lucasamaral_bt3013758/theme/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String displayValue = '';
  
  List<String> numbers = [];
  List<String> operators = [];
  
  String? operation;
  Color operationColor = Colors.white;
  
  String currentInput = '';
  bool resetDisplay = false;
  
  bool dragging = false;
  Offset? dragStart;
  Offset? dragEnd;

  void handleNumberPress(String number) {
    setState(() {
      if (displayValue.length < 10) {
        if (displayValue == '0' || displayValue == 'Error' || resetDisplay) {
          displayValue = number;
          resetDisplay = false;
        } else {
          if (displayValue.startsWith('-')) {
            displayValue = '-$number';
          } else {
            displayValue += number;
          }
        }
        currentInput += number;
      }
    });
  }

  void handleDotPress() {
    setState(() {
      if (!currentInput.contains('.')) {
        currentInput += '.';
        displayValue += '.';
      }
    });
  }

  void handleOperationPress(String op) {
    setState(() {
      if (op == 'C' || op == 'AC') {
        resetCalculator();
      } else if (op == '=') {
        performOperation();
      } else if (op == '+/-') {
        toggleSign();
      } else if (op == '%') {
        calculatePercentage();
      } else {
        addOperation(op);
      }
    });
  }

  void resetCalculator() {
    setState(() {
      displayValue = '0';
      numbers.clear();
      operators.clear();
      currentInput = '';
      resetDisplay = false;
    });
  }

  void toggleSign() {
    setState(() {
      if (displayValue == 'Error') return;

      if (displayValue.startsWith('-')) {
        displayValue = displayValue.substring(1);
      } else {
        displayValue = '-$displayValue';
      }

      currentInput = displayValue;
    });
  }

  void calculatePercentage() {
    setState(() {
      if (currentInput.isNotEmpty) {
        double value = double.parse(currentInput);
        if (value != 0) {
          value = value / 100;
          currentInput = value.toString();
          displayValue = currentInput;
        }
      }
    });
  }

  void addOperation(String op) {
    setState(() {
      if (currentInput.isNotEmpty) {
        numbers.add(currentInput);
        currentInput = '';
      }

      if (numbers.isNotEmpty && operators.length < numbers.length) {
        operators.add(op);
      } else if (operators.isNotEmpty) {
        operators[operators.length - 1] = op;
      }

      resetDisplay = true;
    });
  }

  void performOperation() {
    setState(() {
      if (currentInput.isNotEmpty) {
        numbers.add(currentInput);
        currentInput = '';
      }

      if (numbers.isEmpty || operators.length >= numbers.length) {
        displayError();
        return;
      }

      for (int i = 0; i < operators.length; i++) {
        if (operators[i] == 'x' || operators[i] == '÷') {
          double nLeft = double.parse(numbers[i]);
          double nRight = double.parse(numbers[i + 1]);
          double result;

          if (operators[i] == 'x') {
            result = nLeft * nRight;
          } else {
            if (nRight == 0) {
              displayError();
              return;
            }
            result = nLeft / nRight;
          }

          numbers[i] = result.toString();
          numbers.removeAt(i + 1);
          operators.removeAt(i);
          i--;
        }
      }

      double result = double.parse(numbers[0]);
      for (int i = 0; i < operators.length; i++) {
        double nextNumber = double.parse(numbers[i + 1]);
        switch (operators[i]) {
          case '+':
            result += nextNumber;
            break;
          case '-':
            result -= nextNumber;
            break;
        }
      }

      displayValue = result.toString();
      if (displayValue.endsWith('.0')) {
        displayValue = displayValue.substring(0, displayValue.length - 2);
      }

      numbers.clear();
      operators.clear();
      numbers.add(result.toString());
      resetDisplay = true;
    });
  }

  void displayError() {
    setState(() {
      displayValue = 'Error';
      numbers.clear();
      operators.clear();
      currentInput = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onPanStart: (details) {
              dragStart = details.globalPosition;
              dragging = true;
            },
            onPanUpdate: (details) {
              if (!dragging) return;

              dragEnd = details.globalPosition;

              if (dragEnd!.dx - dragStart!.dx > 50) {
                setState(() {
                  if (displayValue.isNotEmpty) {
                    displayValue =
                        displayValue.substring(0, displayValue.length - 1);
                  }
                });

                dragging = false;
              }
            },
            onPanEnd: (details) {
              dragging = false;
              dragStart = null;
              dragEnd = null;
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 38.0),
              child: Text(
                displayValue.isNotEmpty ? displayValue : '0',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: displayValue.length > 5 ? 120.sp : 220.sp,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 54.w,
              ),
              Button(
                onPressed: () {
                  setState(() {
                    if (displayValue == '0' || displayValue == 'Error') {
                      handleOperationPress('AC');
                    } else {
                      handleOperationPress('C');
                    }
                  });
                },
                backgroundColor: SystemColors.lightGray.toColor(),
                text:
                    displayValue == '0' || displayValue == 'Error' ? 'AC' : 'C',
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                ),
              ),
              SizedBox(
                width: 54.w,
              ),
              Button(
                onPressed: () => {
                  setState(() {
                    handleOperationPress('+/-');
                  })
                },
                backgroundColor: SystemColors.lightGray.toColor(),
                text: '+/-',
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                ),
              ),
              SizedBox(
                width: 54.w,
              ),
              Button(
                onPressed: () => {
                  setState(() {
                    handleOperationPress('%');
                  })
                },
                backgroundColor: SystemColors.lightGray.toColor(),
                text: '%',
                textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                ),
              ),
              SizedBox(
                width: 54.w,
              ),
              Button(
                onPressed: () => {
                  setState(() {
                    handleOperationPress('÷');
                  })
                },
                backgroundColor: SystemColors.vividGamboge.toColor(),
                text: '÷',
                textStyle: TextStyle(
                  color: operationColor,
                  fontSize: 40,
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
              SizedBox(
                width: 54.w,
              ),
              Button(
                onPressed: () => handleNumberPress('7'),
                backgroundColor: SystemColors.eerieBlack.toColor(),
                text: '7',
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
              SizedBox(
                width: 54.w,
              ),
              Button(
                onPressed: () => handleNumberPress('8'),
                backgroundColor: SystemColors.eerieBlack.toColor(),
                text: '8',
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
              SizedBox(
                width: 54.w,
              ),
              Button(
                onPressed: () => handleNumberPress('9'),
                backgroundColor: SystemColors.eerieBlack.toColor(),
                text: '9',
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
              SizedBox(
                width: 54.w,
              ),
              Button(
                onPressed: () => {
                  setState(() {
                    handleOperationPress('x');
                  })
                },
                backgroundColor: SystemColors.vividGamboge.toColor(),
                text: 'x',
                textStyle: TextStyle(
                  color: operationColor,
                  fontSize: 32,
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
              SizedBox(
                width: 54.w,
              ),
              Button(
                onPressed: () => handleNumberPress('4'),
                backgroundColor: SystemColors.eerieBlack.toColor(),
                text: '4',
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
              SizedBox(
                width: 54.w,
              ),
              Button(
                onPressed: () => handleNumberPress('5'),
                backgroundColor: SystemColors.eerieBlack.toColor(),
                text: '5',
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
              SizedBox(
                width: 54.w,
              ),
              Button(
                onPressed: () => handleNumberPress('6'),
                backgroundColor: SystemColors.eerieBlack.toColor(),
                text: '6',
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
              SizedBox(
                width: 54.w,
              ),
              Button(
                onPressed: () => {
                  setState(() {
                    handleOperationPress('-');
                  })
                },
                backgroundColor: SystemColors.vividGamboge.toColor(),
                text: '-',
                textStyle: TextStyle(
                  color: operationColor,
                  fontSize: 32,
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
              SizedBox(
                width: 54.w,
              ),
              Button(
                onPressed: () => handleNumberPress('1'),
                backgroundColor: SystemColors.eerieBlack.toColor(),
                text: '1',
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
              SizedBox(
                width: 54.w,
              ),
              Button(
                onPressed: () => handleNumberPress('2'),
                backgroundColor: SystemColors.eerieBlack.toColor(),
                text: '2',
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
              SizedBox(
                width: 54.w,
              ),
              Button(
                onPressed: () => handleNumberPress('3'),
                backgroundColor: SystemColors.eerieBlack.toColor(),
                text: '3',
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
              SizedBox(
                width: 54.w,
              ),
              Button(
                onPressed: () => {
                  setState(() {
                    handleOperationPress('+');
                  })
                },
                backgroundColor: SystemColors.vividGamboge.toColor(),
                text: '+',
                textStyle: TextStyle(
                  color: operationColor,
                  fontSize: 32,
                ),
              ),
              SizedBox(
                width: 54.w,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: 54.w,
              ),
              Button(
                onPressed: () => handleNumberPress('0'),
                backgroundColor: SystemColors.eerieBlack.toColor(),
                text: '0',
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 54.w,
              ),
              Button(
                onPressed: () => handleDotPress(),
                backgroundColor: SystemColors.eerieBlack.toColor(),
                text: '.',
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                ),
              ),
              SizedBox(
                width: 54.w,
              ),
              Button(
                onPressed: () => {
                  setState(() {
                    handleOperationPress('=');
                  })
                },
                backgroundColor: SystemColors.vividGamboge.toColor(),
                text: '=',
                textStyle: TextStyle(
                  color: operationColor,
                  fontSize: 32,
                ),
              ),
              SizedBox(
                width: 54.w,
              ),
            ],
          )
        ],
      ),
    );
  }
}
