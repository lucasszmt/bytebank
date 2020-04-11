import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/database/contact/contact_dao.dart';
import 'package:bytebank/models/contato.dart';
import 'package:flutter/material.dart';
import 'package:bytebank/components/editor_numerico.dart';
import 'package:bytebank/components/editor.dart';

class ContactsForm extends StatefulWidget {
  final TextEditingController _accountNumberController =
      new TextEditingController();
  final TextEditingController _nameController = new TextEditingController();
  final ContactDao _dao = ContactDao();

  @override
  _ContactsFormState createState() => _ContactsFormState();
}

class _ContactsFormState extends State<ContactsForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Contato'),
      ),
      body: Column(
        children: <Widget>[
          Editor(
            rotulo: 'Full Name',
            dica: 'Ex: Fulano de Souza',
            controlador: widget._nameController,
          ),
          EditorNumeric(
            controlador: widget._accountNumberController,
            rotulo: 'Account Number',
            dica: 'N° da Conta',
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.maxFinite,
              child: RaisedButton(
                onPressed: () {
                  final String name = widget._nameController.text;
                  final int conta =
                      int.tryParse(widget._accountNumberController.text);
                  final Contact contact = Contact(0, name, conta);
                  widget._dao.save(contact);
                  Navigator.pop(context, contact);
                },
                child: Text('Create'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
