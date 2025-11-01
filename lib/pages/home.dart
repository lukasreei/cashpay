import 'package:cashpay/widgets/drawer.dart';
import 'package:cashpay/widgets/navbar.dart';
import 'package:flutter/material.dart';

import '../widgets/appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  Appbar(),
      bottomNavigationBar: Navbar(),
      drawer: drawer(),
      body: const Center(
        child: Text('Bem-vindo ao CashPay!'),
      ),
    );
  }
}
