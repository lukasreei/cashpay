import 'package:cashpay/pages/bolsa.dart';
import 'package:cashpay/widgets/drawer.dart';
import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/navbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  final List<Widget> _pages = [
    const Center(child: Text('Página Home')),   // índice 0
    const BolsaPage(),                           // índice 1 (segunda página)
    const Center(child: Text('Página Cofre')),  // índice 2
    const Center(child: Text('Página Notícias')), // índice 3
  ];

  void _onNavItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Appbar(),
      drawer: drawer(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Navbar(
        selectedIndex: _selectedIndex,
        onTap: _onNavItemTapped,
      ),
    );
  }
}
