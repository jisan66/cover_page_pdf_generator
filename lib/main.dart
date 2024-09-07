import 'package:flutter/material.dart';
import 'package:pdf_generator/view/pages/information_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: const TextTheme(
            displayLarge: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        useMaterial3: false,
      ),
      home: const InformationScreen(),
    );
  }
}
