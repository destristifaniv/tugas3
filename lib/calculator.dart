import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorWidget extends StatefulWidget {
  const CalculatorWidget({super.key});

  @override
  State<CalculatorWidget> createState() => _CalculatorWidgetState();
}

class _CalculatorWidgetState extends State<CalculatorWidget> {
  String _expression = "";
  String _output = "0";

  void _onPressed(String value) {
    setState(() {
      if (value == "C") {
        _expression = "";
        _output = "0";
      } else if (value == "=") {
        try {
          Parser p = Parser();
          Expression exp = p.parse(_expression);
          ContextModel cm = ContextModel();
          _output = exp.evaluate(EvaluationType.REAL, cm).toString();
        } catch (e) {
          _output = "Error";
        }
      } else {
        _expression += value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background putih tanpa gradient
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              // Tampilan ekspresi
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      _expression,
                      style: const TextStyle(fontSize: 28, color: Colors.black87),
                    ),
                  ),
                ),
              ),

              // Tampilan hasil
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _output,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFBB8FCE), // Warna hasil ungu lembut
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Grid tombol dengan warna pastel
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1.8, // Ukuran tombol lebih kecil
                ),
                itemCount: 16,
                itemBuilder: (context, index) {
                  List<String> buttons = [
                    "7", "8", "9", "/",
                    "4", "5", "6", "*",
                    "1", "2", "3", "-",
                    "C", "0", "=", "+"
                  ];

                  // Warna tombol berdasarkan jenisnya
                  Color buttonColor = const Color(0xFFAEDFF7); // Default angka biru pastel
                  if (buttons[index] == "C") {
                    buttonColor = const Color(0xFFF5B7B1); // Tombol "C" pink pastel
                  } else if (buttons[index] == "=") {
                    buttonColor = const Color(0xFFA9DFBF); // Tombol "=" hijau pastel
                  } else if (["/", "*", "-", "+"].contains(buttons[index])) {
                    buttonColor = const Color(0xFFD7BDE2); // Operator warna ungu pastel
                  }

                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        padding: const EdgeInsets.all(12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12), // Tombol lebih membulat
                        ),
                      ),
                      onPressed: () => _onPressed(buttons[index]),
                      child: Text(
                        buttons[index],
                        style: const TextStyle(fontSize: 20, color: Colors.black), // Warna teks tombol hitam
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}