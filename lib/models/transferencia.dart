import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class ListaTransferencias extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia {valor: $valor, numeroConta: $numeroConta}';
  }
}
