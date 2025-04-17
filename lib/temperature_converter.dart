import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'temperature_converter_provider.dart';

class TemperatureConverterWidget extends StatelessWidget {
  const TemperatureConverterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TemperatureConverterProvider>(context);
    final temperatureUnits = ['Celsius', 'Fahrenheit', 'Kelvin', 'Reaumur'];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Input suhu
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Masukkan Suhu',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: Colors.pink[50],
            ),
            onChanged: (value) {
              provider.setInputTemp(double.tryParse(value) ?? 0.0);
            },
          ),
          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: provider.fromUnit,
                  decoration: InputDecoration(
                    labelText: 'Dari',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Colors.blue[50],
                  ),
                  items: temperatureUnits.map((unit) {
                    return DropdownMenuItem(value: unit, child: Text(unit));
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) provider.setFromUnit(value);
                  },
                ),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.swap_horiz, size: 30, color: Colors.blueAccent),
              const SizedBox(width: 10),
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: provider.toUnit,
                  decoration: InputDecoration(
                    labelText: 'Ke',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    filled: true,
                    fillColor: Colors.green[50],
                  ),
                  items: temperatureUnits.map((unit) {
                    return DropdownMenuItem(value: unit, child: Text(unit));
                  }).toList(),
                  onChanged: (value) {
                    if (value != null) provider.setToUnit(value);
                  },
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purple[200],
              padding: const EdgeInsets.all(16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: () => provider.convertTemperature(),
            child: const Text('Konversi', style: TextStyle(fontSize: 20, color: Colors.white)),
          ),

          const SizedBox(height: 20),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.orange[50],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.orangeAccent),
            ),
            child: Column(
              children: [
                const Text('Hasil Konversi:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text(
                  '${provider.convertedTemp.toStringAsFixed(2)} ${provider.toUnit}',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.redAccent),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
