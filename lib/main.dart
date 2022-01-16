import 'package:flutter/material.dart';
import 'models/transferencia.dart';

void main() => runApp(Bytebank());

// ignore: use_key_in_widget_constructors
class Bytebank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: ListaTransferencias(),
    );
  }
}
