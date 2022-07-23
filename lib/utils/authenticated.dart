import 'package:flutter/material.dart';
import 'package:local_restaurants/utils/shared_preferences_util.dart';

class Authenticate {
  final String _registeredPassword =
      SharedPrefs.getString('password') ?? 'No hay datos disponibles';
  final String _registeredUser =
      SharedPrefs.getString('user') ?? 'No hay datos disponibles';

  validateLogin(String user, String password) {
    if (user == _registeredUser && password == _registeredPassword) {
      debugPrint('login exitoso');
      return 'Acceso conecedido';
    } else if (user == 'No hay datos disponibles') {
      debugPrint('Debe registrarse');
      return 'Debe registrarse';
    } else {
      return 'usuario o password incorrectos';
    }
  }
}
