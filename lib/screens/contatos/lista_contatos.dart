import 'package:flutter/material.dart';
import 'package:bytebank/screens/contatos/formulario_contatos.dart';
import 'formulario_contatos.dart';

class ListaContatos extends StatefulWidget {
  @override
  ListaContatosState createState() => ListaContatosState();
}

class ListaContatosState extends State<ListaContatos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de contatos'),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(
                Icons.people,
                size: 16,
              ),
              title: Text('Fulano'),
              subtitle: Text('N° da conta'),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'dica',
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(
                builder: (context) => FormularioContatos(),
              ))
              .then((newContact) => debugPrint('$newContact'));
        },
      ),
    );
  }
}
