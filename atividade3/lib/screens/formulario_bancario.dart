import 'package:flutter/material.dart';
import '../widgets/item_conta.dart';

class FormularioBancarioScreen extends StatefulWidget {
  @override
  _FormularioBancarioScreenState createState() => _FormularioBancarioScreenState();
}

class _FormularioBancarioScreenState extends State<FormularioBancarioScreen> {
  final _formKey = GlobalKey<FormState>();
  final List<String> _titulares = [];
  String? _nomeTitular;

  void _adicionarTitular() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _titulares.add(_nomeTitular!);
      });
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplicação Bancária'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Nome do Titular'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira um nome';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _nomeTitular = value;
                      },
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _adicionarTitular,
                    child: Text('Adicionar'),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _titulares.length,
                itemBuilder: (ctx, index) {
                  return ItemConta(nome: _titulares[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
