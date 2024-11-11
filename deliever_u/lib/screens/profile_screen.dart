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
      backgroundColor: AppColors.tertiaryColor,
      body: Center(
        child: ElevatedButton(
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
