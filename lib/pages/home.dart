import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CashPay 💸')),
      body: const Center(
        child: Text('Bem-vindo ao CashPay!'),
      ),
    );
  }
}
