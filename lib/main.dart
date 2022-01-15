import 'package:flutter/material.dart';

void main() => runApp(Bytebank());

// ignore: use_key_in_widget_constructors
class Bytebank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criando Transferência"),
      ),
      body: Column(
        children: <Widget>[
          Editor(_controladorCampoNumeroConta, 'Número da conta', '0000'),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controladorCampoValor,
              style: const TextStyle(
                fontSize: 24.0,
              ),
              decoration: const InputDecoration(
                  icon: Icon(Icons.monetization_on),
                  labelText: 'Valor',
                  hintText: '0.00'),
              keyboardType: TextInputType.number,
            ),
          ),
          ElevatedButton(
            child: const Text('Confirmar'),
            onPressed: () {
              final int? numeroConta =
                  int.tryParse(_controladorCampoNumeroConta.text);
              final double? valor =
                  double.tryParse(_controladorCampoValor.text);

              if (numeroConta != null && valor != null) {
                final transferenciaCriada = Transferencia(valor, numeroConta);
                debugPrint('');
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$transferenciaCriada'),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

class Editor extends StatelessWidget {
  final TextEditingController _controlador;
  final String _rotulo;
  final String _dica;

  // ignore: use_key_in_widget_constructors
  const Editor(this._controlador, this._rotulo, this._dica);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: _controlador,
        style: const TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          labelText: _rotulo,
          hintText: _dica,
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencia(100.0, 1000)),
          ItemTransferencia(Transferencia(200.0, 2000)),
          ItemTransferencia(Transferencia(300.0, 3000)),
        ],
      ),
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      floatingActionButton: FloatingActionButton(
        // ignore: avoid_print
        onPressed: () => {print('olá mundo!')},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  // ignore: use_key_in_widget_constructors
  const ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: const Icon(Icons.monetization_on),
      title: Text(_transferencia.valor.toString()),
      subtitle: Text(_transferencia.numeroConta.toString()),
    ));
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
