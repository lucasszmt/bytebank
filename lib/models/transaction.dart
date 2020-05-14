class Transaction {
  final double valor;
  final int numeroConta;

  @override
  String toString() {
    return "Valor = $valor  e Numero da Conta = $numeroConta";
  }

  Transaction(this.valor, this.numeroConta);
}
