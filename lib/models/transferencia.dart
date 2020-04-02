class Transferencia {
  final double valor;
  final int numeroConta;

  @override
  String toString() {
    return "Valor = $valor  e Numero da Conta = $numeroConta";
  }

  Transferencia(this.valor, this.numeroConta);
}
