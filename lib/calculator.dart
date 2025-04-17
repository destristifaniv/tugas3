import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'calculator_provider.dart';

class CalculatorWidget extends StatelessWidget {
  const CalculatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CalculatorProvider>(context);

    List<String> buttons = [
      "7", "8", "9", "/",
      "4", "5", "6", "*",
      "1", "2", "3", "-",
      "C", "0", "=", "+"
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      provider.expression,
                      style: const TextStyle(fontSize: 28, color: Colors.black87),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    provider.output,
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFBB8FCE),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 1.8,
                ),
                itemCount: buttons.length,
                itemBuilder: (context, index) {
                  String value = buttons[index];
                  Color buttonColor = const Color(0xFFAEDFF7);
                  if (value == "C") {
                    buttonColor = const Color(0xFFF5B7B1);
                  } else if (value == "=") {
                    buttonColor = const Color(0xFFA9DFBF);
                  } else if (["/", "*", "-", "+"].contains(value)) {
                    buttonColor = const Color(0xFFD7BDE2);
                  }

                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor,
                        padding: const EdgeInsets.all(12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () => provider.onPressed(value),
                      child: Text(
                        value,
                        style: const TextStyle(fontSize: 20, color: Colors.black),
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
