import 'package:shared_preferences/shared_preferences.dart';
//import 'package:shared_preferences_web/shared_preferences_web.dart';

class UserPreference {
  static SharedPreferences _prefers;
  // con el static estoy indicando que solo existira una instancia en toda la ejecución del codigo.

  initPrefers() async {
    UserPreference._prefers = await SharedPreferences.getInstance();
  }

  get nombre {
    /*
    if (_prefers.getString('nombre') == null) {
      return "";
    }
    
    return _prefers.getString('nombre');
    */

    // hay una forma mas eficiente usando un ternario
    // que esepcifica el valor por defecto cuando el atributo esta null
    return _prefers.getString('nombre') ?? '';
  }

  set nombre(String valueNombre) {
    _prefers.setString('nombre', valueNombre);
  }

  get apellido {
    return _prefers.getString('apellido') ?? '';
  }

  set apellido(String valueApellido) {
    _prefers.setString('apellido', valueApellido);
  }

  get edad {
    return _prefers.getInt('edad') ?? 0;
  }

  set edad(int valueEdad) {
    _prefers.setInt('edad', valueEdad);
  }

  bool get estadoCivil {
    return _prefers.getBool('estadoCivil') ?? false;
  }

  set estadoCivil(bool valueestadoCivil) {
    _prefers.setBool('estadoCivil', valueestadoCivil);
  }

  get musicaFavorita {
    return _prefers.getStringList('musica') ?? [];
  }

  // aca se va a sobreescribir a lista completa, pero tambien se pueden  usar metodos que tienen las listas
  // para hacer transacciones como agregar, actualizar, eliinar
  set musicaFavorita(List<String> valueMusica) {
    _prefers.setStringList('musica', valueMusica);
  }

  clean() {
    nombre = '';
    apellido = '';
    edad = 0;
    estadoCivil = false;
    musicaFavorita = [];
  }
}
