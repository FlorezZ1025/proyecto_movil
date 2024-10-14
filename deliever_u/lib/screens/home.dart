import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla de Inicio'),
      ),
      body: Center(
        child: Text(
          'Bienvenido a la pantalla de inicio',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
