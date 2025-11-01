import 'package:flutter/material.dart';

class drawer extends StatefulWidget {
  const drawer({super.key});

  @override
  State<drawer> createState() => _drawerState();
}
Widget _customDivider() {
  return const Padding(
    padding: EdgeInsets.only(left: 32.0, right: 30),
    child: Divider(height: 1, thickness: 0.5, color: Color(0xFFB8B8B8)),
  );
}

class _drawerState extends State<drawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        children: [
          Expanded(
              child: ListView(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 32.0, right: 16.0),
                    leading: const Icon(Icons.person),
                    title: Text("Perfil"),
                  ),
                  _customDivider(),
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 32.0, right: 16.0),
                    leading: const Icon(Icons.person),
                    title: Text("config "),
                  ),
                  _customDivider(),
                  ListTile(
                    contentPadding: const EdgeInsets.only(left: 32.0, right: 16.0),
                    leading: const Icon(Icons.person),
                    title: Text("Perfil"),
                  ),
                ],
              ),
          ),
        ],
      ),
    );
  }
}
