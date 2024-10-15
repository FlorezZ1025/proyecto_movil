import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Esta es la pantalla de la tienda')),
        body: const Placeholder());
  }
}
