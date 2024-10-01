import 'package:flutter/material.dart';

class ItemConta extends StatelessWidget {
  final String nome;

  const ItemConta({required this.nome});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: Icon(Icons.account_circle),
        title: Text(nome),
        subtitle: Text('Conta ativa'),
      ),
    );
  }
}
