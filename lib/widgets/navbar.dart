import 'dart:io';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    final bool isTablet = MediaQuery.of(context).size.width > 600;
    final double navBarHeight = isTablet ? 70 : 55;
    final double iconSize = isTablet ? 28 : 22;
    final double fontSize = isTablet ? 14 : 12;
    final double maxWidth = isTablet ? 600 : double.infinity;


    return Container(
      color: Color(0xFFF5F5F5),
      height: navBarHeight + 10,
      child: Center(
        child: Container(
          width: maxWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, 'Home', 0, 24, 20),
              _buildNavItem(Icons.credit_card, 'credito', 1, 24, 20),
              _buildNavItem(Icons.lock, 'cofre', 1, 24, 20),
              _buildNavItem(Icons.article, 'noticias', 1, 24, 20)
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildNavItem(
      IconData icon, String label, int index, double iconSize, double fontSize) {
    final bool isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: iconSize, color: isSelected ? Colors.orange : Colors.grey)
        ],
      ),
    );
  }
}
