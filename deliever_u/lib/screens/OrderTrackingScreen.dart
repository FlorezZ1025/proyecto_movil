// order_tracking_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../models/models.dart';
import '../providers/provider.dart';
import '../utils/colors.dart';


class OrderTrackingScreen extends ConsumerWidget {
  final String orderId;

  const OrderTrackingScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final order = ref.watch(ordersProvider).firstWhere(
          (o) => o.id == orderId,
      orElse: () => throw Exception('Order not found'),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Seguimiento de Pedido'),
        backgroundColor: AppColors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatusCard(
              'Pedido confirmado',
              'Tu pedido ha sido recibido',
              order.status.index >= OrderStatus.processing.index,
            ),
            _buildTimeline(),
            _buildStatusCard(
              'Preparando tu pedido',
              'El restaurante está preparando tus alimentos',
              order.status.index >= OrderStatus.preparing.index,
            ),
            _buildTimeline(),
            _buildStatusCard(
              'Repartidor en camino al restaurante',
              'Tu repartidor está yendo por tu pedido',
              order.status.index >= OrderStatus.onTheWayToRestaurant.index,
            ),
            _buildTimeline(),
            _buildStatusCard(
              'Pedido recogido',
              'Tu repartidor ya tiene tu pedido',
              order.status.index >= OrderStatus.pickedUp.index,
            ),
            _buildTimeline(),
            _buildStatusCard(
              'Repartidor en camino a ti',
              'Tu pedido está en camino a tu ubicación',
              order.status.index >= OrderStatus.onTheWayToYou.index,
            ),
            _buildTimeline(),
            _buildStatusCard(
              'Pedido entregado',
              '¡Disfruta tu comida!',
              order.status.index >= OrderStatus.delivered.index,
            ),
            const Spacer(),
            if (order.status == OrderStatus.delivered)
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.red,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                  ),
                  onPressed: () {
                    context.push('/auth/login');
                  },
                  child: const Text(
                    'Volver al inicio',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusCard(String title, String subtitle, bool isActive) {
    return Card(
      color: isActive ? AppColors.red.withOpacity(0.1) : Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              isActive ? Icons.check_circle : Icons.timelapse,
              color: isActive ? Colors.green : Colors.grey,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isActive ? Colors.black : Colors.grey,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: isActive ? Colors.black54 : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeline() {
    return Container(
      margin: const EdgeInsets.only(left: 24),
      height: 30,
      width: 2,
      color: Colors.grey[300],
    );
  }
}