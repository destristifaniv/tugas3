import 'package:flutter/material.dart';

class TemperatureConverterProvider with ChangeNotifier {
  double _inputTemp = 0.0;
  double _convertedTemp = 0.0;
  String _fromUnit = 'Celsius';
  String _toUnit = 'Fahrenheit';

  double get inputTemp => _inputTemp;
  double get convertedTemp => _convertedTemp;
  String get fromUnit => _fromUnit;
  String get toUnit => _toUnit;

  void setInputTemp(double value) {
    _inputTemp = value;
    notifyListeners();
  }

  void setFromUnit(String value) {
    _fromUnit = value;
    notifyListeners();
  }

  void setToUnit(String value) {
    _toUnit = value;
    notifyListeners();
  }

  void convertTemperature() {
    if (_fromUnit == _toUnit) {
      _convertedTemp = _inputTemp;
    } else if (_fromUnit == 'Celsius') {
      if (_toUnit == 'Fahrenheit') {
        _convertedTemp = (_inputTemp * 9 / 5) + 32;
      } else if (_toUnit == 'Kelvin') {
        _convertedTemp = _inputTemp + 273.15;
      } else if (_toUnit == 'Reaumur') {
        _convertedTemp = _inputTemp * 4 / 5;
      }
    } else if (_fromUnit == 'Fahrenheit') {
      if (_toUnit == 'Celsius') {
        _convertedTemp = (_inputTemp - 32) * 5 / 9;
      } else if (_toUnit == 'Kelvin') {
        _convertedTemp = (_inputTemp - 32) * 5 / 9 + 273.15;
      } else if (_toUnit == 'Reaumur') {
        _convertedTemp = (_inputTemp - 32) * 4 / 9;
      }
    } else if (_fromUnit == 'Kelvin') {
      if (_toUnit == 'Celsius') {
        _convertedTemp = _inputTemp - 273.15;
      } else if (_toUnit == 'Fahrenheit') {
        _convertedTemp = (_inputTemp - 273.15) * 9 / 5 + 32;
      } else if (_toUnit == 'Reaumur') {
        _convertedTemp = (_inputTemp - 273.15) * 4 / 5;
      }
    } else if (_fromUnit == 'Reaumur') {
      if (_toUnit == 'Celsius') {
        _convertedTemp = _inputTemp * 5 / 4;
      } else if (_toUnit == 'Fahrenheit') {
        _convertedTemp = (_inputTemp * 9 / 4) + 32;
      } else if (_toUnit == 'Kelvin') {
        _convertedTemp = (_inputTemp * 5 / 4) + 273.15;
      }
    }
    notifyListeners();
  }
}
