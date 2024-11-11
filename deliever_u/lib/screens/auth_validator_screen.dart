import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rappi_u/providers/auth_provider.dart';
import 'package:rappi_u/screens/home_screen.dart';
import 'package:rappi_u/screens/login_screen.dart';

class AuthValidatorScreen extends ConsumerWidget {
  const AuthValidatorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final loginState = ref.watch(loginStreamStateProvider);
    return loginState.when(
      data: (userSession) {
        if (userSession != null) {
          return HomeScreen();
        }
        return const LoginScreen();
      },
      error: (error, trace) => const LoginScreen(),
      loading: () => Container(
        height: 200,
        width: 200,
        color: Colors.black,
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
