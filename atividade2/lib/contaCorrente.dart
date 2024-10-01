import 'package:atividade2/contaBancaria.dart';

class ContaCorrente extends ContaBancaria<int> {
  double limite;

  ContaCorrente(int numeroConta, double saldo, this.limite) : super(numeroConta, saldo);

  @override
  void sacar(double valor) {
    if (valor <= saldo + limite) {
      saldo -= valor;
    } else {
      print('Saldo e limite insuficientes.');
    }
  }
}

class ContaPoupanca extends ContaBancaria<int> {
  double taxaJuros;

  ContaPoupanca(int numeroConta, double saldo, this.taxaJuros) : super(numeroConta, saldo);

  void aplicarJuros() {
    saldo += saldo * taxaJuros;
  }
}
