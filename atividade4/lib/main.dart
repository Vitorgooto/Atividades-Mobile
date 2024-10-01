import 'package:flutter/material.dart';
import 'screens/formulario.dart';

void main() {
  runApp(MeuApp());
}

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicativo CRUD',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FormularioScreen(),
    );
  }
}
