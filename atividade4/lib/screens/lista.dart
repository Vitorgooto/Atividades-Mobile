import 'package:flutter/material.dart';
import '../models/usuario.dart';

class ListaScreen extends StatefulWidget {
  final List<Usuario> usuarios;

  const ListaScreen({required this.usuarios});

  @override
  _ListaScreenState createState() => _ListaScreenState();
}

class _ListaScreenState extends State<ListaScreen> {
  void _removerUsuario(int index) {
    setState(() {
      widget.usuarios.removeAt(index);
    });
  }

  void _editarUsuario(int index) {
    final usuario = widget.usuarios[index];
    final _nomeController = TextEditingController(text: usuario.nome);
    final _emailController = TextEditingController(text: usuario.email);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Editar Usuário'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome'),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                setState(() {
                  widget.usuarios[index] = Usuario(
                    nome: _nomeController.text,
                    email: _emailController.text,
                  );
                });
                Navigator.of(context).pop();
              },
              child: Text('Salvar'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancelar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
      ),
      body: ListView.builder(
        itemCount: widget.usuarios.length,
        itemBuilder: (ctx, index) {
          return Card(
            child: ListTile(
              title: Text(widget.usuarios[index].nome),
              subtitle: Text(widget.usuarios[index].email),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () => _editarUsuario(index),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _removerUsuario(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
