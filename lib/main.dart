import 'package:flutter/material.dart';
import 'pages/home.dart';


void main() async {
  runApp(const CashPayApp());
}
class CashPayApp extends StatelessWidget {
  const CashPayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
