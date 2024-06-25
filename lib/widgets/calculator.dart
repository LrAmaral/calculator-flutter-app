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
  String displayValue = '0';
  String storedValue = '';
  String operation = '';
  Color operationColor = Colors.white;
  bool acButtonPressed = false;
  bool plusMinusButtonPressed = false;
  bool percentButtonPressed = false;
  bool plusPressed = false;
  bool multiPressed = false;
  bool subPressed = false;
  bool divisionPressed = false;

  void handleNumberPress(String number) {
    setState(() {
      if (displayValue.length < 10) {
        if (displayValue == '0' || displayValue == 'Error') {
          displayValue = number;
        } else {
          if (displayValue.startsWith('-')) {
            displayValue = '-$number';
          } else {
            displayValue += number;
          }
        }
      }
    });
  }

  void handleDotPress() {
    setState(() {
      if (!displayValue.contains('.')) {
        displayValue += '.';
      }
    });
  }

  void handleOperationPress(String op) {
    setState(() {
      if (op == 'C') {
        resetCalculator();
      } else if (displayValue == 'Error' && op != 'C') {
        displayValue = '0';
      } else {
        performOperation(op);
      }
    });
  }

  void resetCalculator() {
    displayValue = '0';
    storedValue = '';
  }

  void performOperation(String op) {
    if (op == '=') {
      if (storedValue.isEmpty || displayValue.isEmpty) {
        displayValue = displayValue;
      } else {
        calculateResult();
      }
    } else if (op == '%') {
      calculatePercentage();
    } else if (op == '+/-' && displayValue != 'Error') {
      toggleSign();
    } else {
      setOperation(op);
    }
  }

  void calculateResult() {
    try {
      double value1 = double.parse(storedValue);
      double value2 = double.parse(displayValue);
      double result;

      switch (operation) {
        case '+':
          result = value1 + value2;
          break;
        case '-':
          result = value1 - value2;
          break;
        case 'x':
          result = value1 * value2;
          break;
        case '÷':
          if (value2 != 0) {
            result = value1 / value2;
          } else {
            displayError();
            return;
          }
          break;
        default:
          return;
      }

      displayValue =
          (result % 1 == 0) ? result.toInt().toString() : result.toString();
      storedValue = '';
      operation = '';
      operationColor = Colors.white;
    } catch (e) {
      displayError();
    }
  }

  void calculatePercentage() {
    try {
      double value1 = double.parse(displayValue);
      double result = value1 / 100.0;
      displayValue =
          (result % 1 == 0) ? result.toInt().toString() : result.toString();
      storedValue = '';
      operation = '';
      operationColor = Colors.white;
    } catch (e) {
      displayError();
    }
  }

  void toggleSign() {
    displayValue = displayValue.startsWith('-')
        ? displayValue.substring(1)
        : '-$displayValue';
  }

  void setOperation(String op) {
    if (operation.isNotEmpty && storedValue.isNotEmpty) {
      handleOperationPress('=');
    }
    storedValue = displayValue;
    displayValue = '0';
    operation = op;
    operationColor = Colors.white;
  }

  void displayError() {
    displayValue = 'Error';
    storedValue = '';
    operation = '';
    operationColor = Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 38.0),
            child: Text(
              displayValue,
              style: TextStyle(
                color: Colors.white,
                fontSize: displayValue.length > 5 ? 120.sp : 220.sp,
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
                    acButtonPressed = true;
                    plusMinusButtonPressed = false;
                    percentButtonPressed = false;
                  });
                },
                backgroundColor: acButtonPressed
                    ? Colors.white
                    : SystemColors.lightGray.toColor(),
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
                    acButtonPressed = false;
                    plusMinusButtonPressed = true;
                    percentButtonPressed = false;
                  })
                },
                backgroundColor: plusMinusButtonPressed
                    ? Colors.white
                    : SystemColors.lightGray.toColor(),
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
                    acButtonPressed = false;
                    plusMinusButtonPressed = false;
                    percentButtonPressed = true;
                  })
                },
                backgroundColor: percentButtonPressed
                    ? Colors.white
                    : SystemColors.lightGray.toColor(),
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
                    divisionPressed = true;
                    plusPressed = false;
                    subPressed = false;
                    multiPressed = false;
                  })
                },
                backgroundColor: operation == '÷'
                    ? operationColor
                    : SystemColors.vividGamboge.toColor(),
                text: '÷',
                textStyle: TextStyle(
                  color: divisionPressed
                      ? SystemColors.vividGamboge.toColor()
                      : Colors.white,
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
                    multiPressed = true;
                    plusPressed = false;
                    subPressed = false;
                    divisionPressed = false;
                  })
                },
                backgroundColor: operation == 'x'
                    ? operationColor
                    : SystemColors.vividGamboge.toColor(),
                text: 'x',
                textStyle: TextStyle(
                  color: multiPressed
                      ? SystemColors.vividGamboge.toColor()
                      : Colors.white,
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
                    subPressed = true;
                    plusPressed = false;
                    divisionPressed = false;
                    multiPressed = false;
                  })
                },
                backgroundColor: operation == '-'
                    ? operationColor
                    : SystemColors.vividGamboge.toColor(),
                text: '-',
                textStyle: TextStyle(
                  color: subPressed
                      ? SystemColors.vividGamboge.toColor()
                      : Colors.white,
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
                    plusPressed = true;
                    divisionPressed = false;
                    subPressed = false;
                    multiPressed = false;
                  })
                },
                backgroundColor: operation == '+'
                    ? operationColor
                    : SystemColors.vividGamboge.toColor(),
                text: '+',
                textStyle: TextStyle(
                  color: plusPressed
                      ? SystemColors.vividGamboge.toColor()
                      : Colors.white,
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
                    plusPressed = false;
                    divisionPressed = false;
                    subPressed = false;
                    multiPressed = false;
                  })
                },
                backgroundColor: operation == '='
                    ? operationColor
                    : SystemColors.vividGamboge.toColor(),
                text: '=',
                textStyle: const TextStyle(
                  color: Colors.white,
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
