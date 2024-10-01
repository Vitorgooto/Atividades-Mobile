import 'package:flutter/material.dart';
import 'lista.dart';
import '../models/usuario.dart';

class FormularioScreen extends StatefulWidget {
  @override
  _FormularioScreenState createState() => _FormularioScreenState();
}

class _FormularioScreenState extends State<FormularioScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<Usuario> _usuarios = [];

  String? _nome;
  String? _email;

  void _adicionarUsuario() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _usuarios.add(Usuario(nome: _nome!, email: _email!));
      });
      _formKey.currentState!.reset();
    }
  }

  void _irParaListaUsuarios() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ListaScreen(usuarios: _usuarios),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Usuários'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Nome'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira um nome';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _nome = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira um email';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _adicionarUsuario,
                    child: Text('Adicionar Usuário'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _irParaListaUsuarios,
              child: Text('Ver Lista de Usuários'),
            ),
          ],
        ),
      ),
    );
  }
}
