import 'package:flutter/material.dart';

class EditorNumeric extends StatelessWidget {
  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final Icon icone;

  EditorNumeric({this.controlador, this.rotulo, this.dica, this.icone});

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