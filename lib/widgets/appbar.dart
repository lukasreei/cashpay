import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Appbar extends StatefulWidget implements PreferredSizeWidget {
  const Appbar({super.key});

  @override
  State<Appbar> createState() => _AppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Cash Pay",
        style: GoogleFonts.lato(fontSize: 22, fontWeight: FontWeight.w500),),
      backgroundColor: Colors.orange[900],
      elevation: 0,
      centerTitle: true,
    );
  }
}
