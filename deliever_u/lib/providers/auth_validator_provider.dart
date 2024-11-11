import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailValidatorProvider = Provider<String? Function(String?)>((ref) {
  return (value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese un correo';
    }

    bool emailValid = RegExp('[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,5}').hasMatch(value);

    if (!emailValid) {
      return 'Ingrese un correo válido';
    }
  };
});

final passwordValidatorProvider = Provider<String? Function(String?)>((ref) {
  return (value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese una contraseña';
    }

    if (value.length < 6) {
      return 'La contraseña debe tener al menos 6 caracteres';
    }
  };
});
