import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';
import 'package:bytebank/components/editor_numerico.dart';

const _tituloAppBar = 'Criando Transferência';
const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';
const _rotuloCampoNumeroConta = 'Número da conta';
const _dicaCampoNumeroConta = '0000';
const _textoBotaoConfirmar = 'Confirmar';

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
      appBar: AppBar(title: Text(_tituloAppBar)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            EditorNumeric(
              controlador: widget._controladorCampoNumeroConta,
              dica: _dicaCampoNumeroConta,
              rotulo: _rotuloCampoNumeroConta,
            ),
            EditorNumeric(
              controlador: widget._controladorCampoValor,
              dica: _dicaCampoValor,
              rotulo: _rotuloCampoValor,
              icone: (Icon(
                Icons.monetization_on,
                size: 24,
              )),
            ),
            RaisedButton(
              child: Text(_textoBotaoConfirmar),
              onPressed: () => _criaTransferencia(context),
            ),
          ],
        ),
      ),
    );
  }

  void _criaTransferencia(
    BuildContext context,
  ) {
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
