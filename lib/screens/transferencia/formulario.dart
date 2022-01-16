// ignore: use_key_in_widget_constructors
import 'package:bytebank/components/editor.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';

const _tituloAppBar = 'Criando Transferência';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';
const _rotuloCampoNumeroConta = 'Número da conta';
const _dicaCampoNumeroConta = '0000';
const _textoBotao = 'Confirmar';

// ignore: use_key_in_widget_constructors
class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_tituloAppBar),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: _controladorCampoNumeroConta,
              dica: _dicaCampoNumeroConta,
              rotulo: _rotuloCampoNumeroConta,
            ),
            Editor(
              controlador: _controladorCampoValor,
              dica: _dicaCampoValor,
              rotulo: _rotuloCampoValor,
              icone: Icons.monetization_on,
            ),
            ElevatedButton(
              child: const Text(_textoBotao),
              onPressed: () {
                final int? numeroConta =
                    int.tryParse(_controladorCampoNumeroConta.text);
                final double? valor =
                    double.tryParse(_controladorCampoValor.text);

                _criaTransferencia(context, numeroConta, valor);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
void _criaTransferencia(context, numeroConta, valor) {
  if (numeroConta != null && valor != null) {
    final transferenciaCriada = Transferencia(valor, numeroConta);
    Navigator.pop(context, transferenciaCriada);
    // debugPrint('$transferenciaCriada');
    // ScaffoldMessenger.of(context).showSnackBar(
    //   SnackBar(
    //     content: Text('$transferenciaCriada'),
    //   ),
    // );
  }
}
