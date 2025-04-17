import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorProvider extends ChangeNotifier {
  String _expression = '';
  String _output = '0';

  String get expression => _expression;
  String get output => _output;

  void onPressed(String value) {
    if (value == 'C') {
      _expression = '';
      _output = '0';
    } else if (value == '=') {
      try {
        Parser p = Parser();
        Expression exp = p.parse(_expression);
        ContextModel cm = ContextModel();
        double result = exp.evaluate(EvaluationType.REAL, cm);
        _output = result % 1 == 0 ? result.toInt().toString() : result.toString();
      } catch (e) {
        _output = 'Error';
      }
    } else {
      _expression += value;
    }
    notifyListeners();
  }
}
