import 'package:bytebank/models/transaction.dart';
import 'package:flutter/material.dart';

import 'form.dart';

class TransferList extends StatefulWidget {
  final List<Transaction> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return TransferListState();
  }
}

class TransferListState extends State<TransferList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transferência"),
      ),
      body: ListView.builder(
        itemCount: widget._transferencias.length,
        itemBuilder: (context, indice) {
          final transferencia = widget._transferencias[indice];
          return ItemTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _criaTransferencia(context),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return TransferForm();
      // ignore: missing_return
    })).then((transferenciaRecebidas) {
      if (transferenciaRecebidas != null) {
        setState(() {
          widget._transferencias.add(transferenciaRecebidas);
        });
      }
    });
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transaction _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      leading: Icon(Icons.monetization_on),
      title: Text(_transferencia.valor.toString()),
      subtitle: Text(_transferencia.numeroConta.toString()),
    ));
  }
}
