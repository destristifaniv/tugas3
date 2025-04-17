import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'login_page.dart';
import 'calculator.dart';
import 'temperature_converter.dart';
import 'calculator_provider.dart';
import 'temperature_converter_provider.dart'; // ✅ Tambahkan ini

void main() {
  runApp(
    MultiProvider( // ✅ Ganti jadi MultiProvider
      providers: [
        ChangeNotifierProvider(create: (_) => CalculatorProvider()),
        ChangeNotifierProvider(create: (_) => TemperatureConverterProvider()), // ✅ Tambah ini
      ],
      child: const MyApp(),
    ),
  );
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
      home: const MyLoginPage(),
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
            TemperatureConverterWidget(), // Nanti widget ini gunakan provider juga
          ],
        ),
      ),
    );
  }
}
