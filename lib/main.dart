import 'package:bytebank/models/contato.dart';
import 'package:bytebank/screens/contatos/lista_contatos.dart';
import 'package:bytebank/screens/transferencia/formulario.dart';
import 'package:bytebank/screens/transferencia/lista.dart';
import 'package:bytebank/screens/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:bytebank/database/app_database.dart';

void main() {
  runApp(Bytebank());
  //createDatabase();
  save(Contact(0, 'Robson', 123)).then((id) {
    findAll().then((contacts) => debugPrint(contacts.toString()));
  });
}

class Bytebank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green[900],
          accentColor: Colors.blueAccent[700],
          buttonTheme: ButtonThemeData(
              buttonColor: Colors.blueAccent[700],
              textTheme: ButtonTextTheme.primary)),
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => Dashboard(),
        '/listacontatos': (context) => ListaContatos(),
        '/listatransferencia': (context) => ListaTransferencias(),
        '/formulario': (context) => FormularioTransferencia()
      },
    );
  }
}
