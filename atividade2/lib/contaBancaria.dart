class ContaBancaria<T> {
  T numeroConta;
  double saldo;

  ContaBancaria(this.numeroConta, this.saldo);

  void depositar(double valor) {
    saldo += valor;
  }

  void sacar(double valor) {
    if (valor <= saldo) {
      saldo -= valor;
    } else {
      print('Saldo insuficiente.');
    }
  }

  @override
  String toString() {
    return 'ContaBancaria{numeroConta: $numeroConta, saldo: $saldo}';
  }
}
