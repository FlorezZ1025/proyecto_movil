import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/store_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
    builder: (BuildContext context) {
      return IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {context.push('/'); }
      );
    },
  ),
        title: const Text('DelieverU'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              //Lógica para la pantalla de usuario
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tiendas Recomendadas',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            StoreCard(
                storeName: 'Donde Tavo', description: 'Restaurante', image: ''),
            StoreCard(
                storeName: 'Kiosco Udem',
                description: 'Comidas Rapidas',
                image: ''),
            StoreCard(
                storeName: 'Sr Gourmet', description: 'Restaurante', image: ''),
            const SizedBox(height: 10),
            Center(
                child: TextButton(
                    onPressed: () {
                      context.push('/stores');
                    },
                    child: const Text('Ver todas las tiendas'))),
            const Text(
              'Ofertas del día',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
