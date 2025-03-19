import 'package:flutter/material.dart';
import 'login_page.dart'; // Import halaman login
import 'calculator.dart';
import 'temperature_converter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator & Konversi Suhu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyLoginPage(), // ganti halamamn utama menjadi login
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Kalkulator & Konversi Suhu'),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Kalkulator"),
              Tab(text: "Konversi Suhu"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CalculatorWidget(),
            TemperatureConverterWidget(),
          ],
        ),
      ),
    );
  }
}