import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Navbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const Navbar({
    Key? key,
    required this.selectedIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.width > 600;
    final double navBarHeight = isTablet ? 70 : 55;
    final double iconSize = isTablet ? 28 : 22;
    final double fontSize = isTablet ? 14 : 12;
    final double maxWidth = isTablet ? 600 : double.infinity;

    return Container(
      color: const Color(0xFFF5F5F5),
      height: navBarHeight + 10,
      child: Center(
        child: Container(
          width: maxWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, 'Home', 0, iconSize, fontSize),
              _buildNavItem('assets/icons/bolsa.svg', 'Bolsa', 1, iconSize, fontSize),
              _buildNavItem(Icons.lock, 'Cofre', 2, iconSize, fontSize),
              _buildNavItem(Icons.article, 'Notícias', 3, iconSize, fontSize),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(dynamic icon, String label, int index, double iconSize, double fontSize) {
    final bool isSelected = selectedIndex == index;

    return Expanded(
      child: InkWell(
        onTap: () => onTap(index),
        borderRadius: BorderRadius.circular(12),
        splashColor: Colors.orange.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon is IconData)
                Icon(icon,
                    size: iconSize,
                    color: isSelected ? Colors.orange : Colors.grey)
              else if (icon is String)
                SvgPicture.asset(
                  icon,
                  width: iconSize,
                  height: iconSize,
                  colorFilter: ColorFilter.mode(
                    isSelected ? Colors.orange : Colors.grey,
                    BlendMode.srcIn,
                  ),
                ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: fontSize,
                  color: isSelected ? Colors.orange : Colors.grey,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
