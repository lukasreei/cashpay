import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

void mostrarErro(BuildContext context, String mensagem) {
  Flushbar(
    message: mensagem,
    duration: const Duration(seconds: 3),
    backgroundColor: Colors.red,
  ).show(context);
}
