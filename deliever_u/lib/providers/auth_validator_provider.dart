import 'package:flutter_riverpod/flutter_riverpod.dart';

final emailValidatorProvider = Provider<String? Function(String?)>((ref) {
  return (value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese un correo';
    }

    bool emailValid = RegExp(
            '[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*@[a-zA-Z0-9_]+([.][a-zA-Z0-9_]+)*[.][a-zA-Z]{2,5}')
        .hasMatch(value);

    if (!emailValid) {
      return 'Ingrese un correo válido';
    }
    return null;
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
    return null;
  };
});

final nameValidatorProvider = Provider<String? Function(String?)>((ref) {
  return (value) {
    if (value == null || value.isEmpty) {
      return 'Campo vacío';
    }

    bool nameValid =
        RegExp(r"^[A-ZÁÉÍÓÚÑ][a-zA-ZÁÉÍÓÚÑs'-0-9]{1,50}$").hasMatch(value);

    if (!nameValid) {
      return 'Primera letra mayúscula y sin caracteres especiales';
    }
    return null;
  };
});

final numberValidatorProvider = Provider<String? Function(String?)>((ref) {
  return (value) {
    if (value == null || value.isEmpty) {
      return 'Campo vacío';
    }

    bool numberValid = RegExp(r'^[0-9]+$').hasMatch(value);

    if (!numberValid) {
      return 'Valor inválido';
    }
    return null;
  };
});
