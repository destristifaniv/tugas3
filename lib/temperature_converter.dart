import 'package:flutter/material.dart';

class TemperatureConverterWidget extends StatefulWidget {
  const TemperatureConverterWidget({super.key});

  @override
  State<TemperatureConverterWidget> createState() => _TemperatureConverterWidgetState();
}

class _TemperatureConverterWidgetState extends State<TemperatureConverterWidget> {
  double _inputTemp = 0.0;
  double _convertedTemp = 0.0;
  String _fromUnit = 'Celsius';
  String _toUnit = 'Fahrenheit';

  final List<String> _temperatureUnits = ['Celsius', 'Fahrenheit', 'Kelvin', 'Reaumur'];

  void _convertTemperature() {
    setState(() {
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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Input Suhu
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Masukkan Suhu',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: Colors.pink[50], // Warna pastel
            ),
            onChanged: (value) {
              setState(() {
                _inputTemp = double.tryParse(value) ?? 0.0;
              });
            },
          ),
          const SizedBox(height: 20),

          // Dropdown Sejajar dalam Satu Baris
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Dropdown "Dari"
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: _fromUnit,
                  decoration: InputDecoration(
                    labelText: 'Dari',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Colors.blue[50], // Warna pastel
                  ),
                  items: _temperatureUnits.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _fromUnit = value!;
                    });
                  },
                ),
              ),
              const SizedBox(width: 10),

              // Ikon Panah 🔄
              const Icon(Icons.swap_horiz, size: 30, color: Colors.blueAccent),

              const SizedBox(width: 10),

              // Dropdown "Ke"
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: _toUnit,
                  decoration: InputDecoration(
                    labelText: 'Ke',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Colors.green[50], // Warna pastel
                  ),
                  items: _temperatureUnits.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _toUnit = value!;
                    });
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Tombol Konversi
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple[200], // Warna pastel
              padding: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: _convertTemperature,
            child: const Text(
              'Konversi',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),

          const SizedBox(height: 20),

          // Hasil Konversi
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orange[50], // Warna pastel
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.orangeAccent),
            ),
            child: Column(
              children: [
                const Text(
                  'Hasil Konversi:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${_convertedTemp.toStringAsFixed(2)} $_toUnit',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
