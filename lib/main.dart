import 'package:auros_printer/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      title: 'Arus Blutooth Printer',
      themeMode: ThemeMode.dark,
      home: const HomePage(),
    );
  }
}
