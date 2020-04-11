import 'package:bytebank/components/contact_card.dart';
import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contato.dart';
import 'package:flutter/material.dart';
import 'package:bytebank/screens/contatos/formulario_contatos.dart';

class ContactsList extends StatefulWidget {
  @override
  ContactsListState createState() => ContactsListState();
}

class ContactsListState extends State<ContactsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de contatos'),
      ),
      body: FutureBuilder<List<Contact>>(
        initialData: List(),
        future: findAll(),
        // ignore: missing_return
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              // TODO: Handle this case.
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      backgroundColor: Colors.green,
                    ),
                    Text('Loading')
                  ],
                ),
              );
              break;
            case ConnectionState.active:
              // TODO: Handle this case.
              break;
            case ConnectionState.done:
              final List<Contact> contacts = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contact contact = contacts[index];
                  return ContactCard(contact);
                },
                itemCount: contacts.length,
              );
              break;
          }
          return Text('Erro Inesperado');
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'dica',
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FormularioContatos(),
          ));
        },
      ),
    );
  }
}
