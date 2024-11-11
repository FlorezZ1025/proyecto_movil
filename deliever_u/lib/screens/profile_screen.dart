import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rappi_u/controllers/login_controller.dart';
import 'package:rappi_u/utils/colors.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
        title: const Text('Perfil'),
      ),
      backgroundColor: AppColors.tertiaryColor,
      body: Center(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.secondaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () {
              ref.read(signInControllerProvider.notifier).logout();
              context.go('/auth');
            },
            child: const Text(
              'Cerrar Sesión',
              style: TextStyle(fontSize: 32, color: AppColors.black),
            )),
      ),
    );
  }
}
