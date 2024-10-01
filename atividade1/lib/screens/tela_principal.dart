import 'package:flutter/material.dart';
import 'package:atividade1/widgets/cartas.dart';


class TelaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView com Card'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: const <Widget>[
          CartaoPersonalizado(
            icone: Icons.star,
            titulo: 'Item 1',
            subtitulo: 'Descrição do item 1',
          ),
          CartaoPersonalizado(
            icone: Icons.star,
            titulo: 'Item 2',
            subtitulo: 'Descrição do item 2',
          ),
          CartaoPersonalizado(
            icone: Icons.star,
            titulo: 'Item 3',
            subtitulo: 'Descrição do item 3',
          ),
          CartaoPersonalizado(
            icone: Icons.star,
            titulo: 'Item 4',
            subtitulo: 'Descrição do item 4',
          ),
        ],
      ),
    );
  }
}
