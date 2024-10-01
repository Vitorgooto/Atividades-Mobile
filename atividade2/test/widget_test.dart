import 'package:atividade2/contaCorrente.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('ContaBancaria', () {
    test('Depósito e saque em Conta Corrente', () {
      var conta = ContaCorrente(123, 1000.0, 500.0);
      conta.depositar(500.0);
      expect(conta.saldo, 1500.0);
      conta.sacar(2000.0);
      expect(conta.saldo, -500.0);
    });

    test('Aplicação de juros em Conta Poupança', () {
      var conta = ContaPoupanca(456, 1000.0, 0.05);
      conta.aplicarJuros();
      expect(conta.saldo, 1050.0);
    });
  });
}
