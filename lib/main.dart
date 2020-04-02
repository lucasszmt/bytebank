import 'package:flutter/material.dart';

void main() => runApp(Bytebank());

class Bytebank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => ListaTransferencias(),
        '/formulario': (context) => FormularioTransferencia()
      },
    );
  }
}

class FormularioTransferencia extends StatefulWidget {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Formulário de Transferência')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controlador: widget._controladorCampoNumeroConta,
              dica: '0000',
              rotulo: 'Número da Conta',
            ),
            Editor(
              controlador: widget._controladorCampoValor,
              dica: '00.00',
              rotulo: 'Valor',
              icone: (Icon(
                Icons.monetization_on,
                size: 24,
              )),
            ),
            buildRaisedButton(context),
          ],
        ),
      ),
    );
  }

  RaisedButton buildRaisedButton(BuildContext context) {
    return RaisedButton(
      child: Text("Confirmar"),
      onPressed: () => _criaTransferencia(context),
    );
  }

  void _criaTransferencia(
    BuildContext context,
  ) {
    debugPrint('Clicou no Confirmar');
    final int numeroConta =
        int.tryParse(widget._controladorCampoNumeroConta.text);
    final double valorTransferencia =
        double.tryParse(widget._controladorCampoValor.text);

    if (numeroConta != null && valorTransferencia != null) {
      final transferenciaCriada =
          Transferencia(valorTransferencia, numeroConta);
      Navigator.pop(context, transferenciaCriada);
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final Icon icone;

  Editor({this.controlador, this.rotulo, this.dica, this.icone});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: controlador,
        style: TextStyle(fontSize: 24),
        keyboardType: TextInputType.numberWithOptions(),
        decoration: InputDecoration(
          labelText: this.rotulo,
          hintText: this.dica,
          icon: icone != null ? icone : null,
        ),
      ),
    );
  }
}

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
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
        onPressed: () {
          final Future<Transferencia> future =
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FormularioTransferencia();
          }));
          future.then((transferenciaRecebidas) {
            Future.delayed(Duration(seconds: 2), () {
              if (transferenciaRecebidas != null) {
                setState(() {
                  widget._transferencias.add(transferenciaRecebidas);
                });
              }
            });

            //TODO Tentar arrumar o SnackBar
            //Scaffold.of(context).showSnackBar(SnackBar(
            //content: Text('$transferenciaRecebidas'),
            //));
          });
        },
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencia _transferencia;

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

class Transferencia {
  final double valor;
  final int numeroConta;

  @override
  String toString() {
    return "Valor = $valor  e Numero da Conta = $numeroConta";
  }

  Transferencia(this.valor, this.numeroConta);
}
