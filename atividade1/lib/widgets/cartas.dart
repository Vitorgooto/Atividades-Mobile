import 'package:flutter/material.dart';

class CartaoPersonalizado extends StatelessWidget {
  final IconData icone;
  final String titulo;
  final String subtitulo;

  const CartaoPersonalizado({
    required this.icone,
    required this.titulo,
    required this.subtitulo,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icone),
        title: Text(titulo),
        subtitle: Text(subtitulo),
      ),
    );
  }
}
