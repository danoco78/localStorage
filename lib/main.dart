import 'package:flutter/material.dart';
import 'package:local_storage/helpers/user_preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  UserPreference userPreference = new UserPreference();
  await userPreference.initPrefers();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final nombreController = TextEditingController();
  final apellidoController = TextEditingController();
  final edadController = TextEditingController();

  List<String> miMusica = [];

  UserPreference userPreference = UserPreference();

  @override
  void initState() {
    UserPreference userPreference = UserPreference();

    nombreController.text = userPreference.nombre;
    apellidoController.text = userPreference.apellido;
    edadController.text = userPreference.edad.toString();

    miMusica = userPreference.favoriteMusic;

    super.initState();
  }

  init() {
    nombreController.text = userPreference.nombre;
    apellidoController.text = userPreference.apellido;
    edadController.text = userPreference.edad.toString();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Almacenamiento local"),
        ),
        body: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              TextField(
                controller: nombreController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(4), hintText: "Nombre"),
                onChanged: (String valueNombre) {
                  print(valueNombre);
                  userPreference.nombre = valueNombre;
                },
              ),
              TextField(
                controller: apellidoController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(4), hintText: "Apellido"),
                onChanged: (String valueApellido) {
                  print(valueApellido);
                  userPreference.apellido = valueApellido;
                },
              ),
              TextField(
                controller: edadController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(4), hintText: "Edad"),
                onChanged: (String valueEdad) {
                  print(valueEdad);
                  try {
                    userPreference.edad = int.parse(valueEdad);
                  } catch (e) {}
                },
              ),
              DropdownButton(
                  value: userPreference.estadoCivil, //Valor por defecto
                  isExpanded: true,
                  items: [
                    DropdownMenuItem(
                      child: Text("Casado"),
                      value: true,
                    ),
                    DropdownMenuItem(
                      child: Text("Soltero"),
                      value: false,
                    ),
                  ],
                  onChanged: (bool valueCasado) {
                    setState(() {
                      userPreference.estadoCivil = valueCasado;
                    });
                  }),
              musicCheckbox(),
              Spacer(),
              ElevatedButton.icon(
                  //onPressed: userPreference.clean,
                  onPressed: () {
                    setState(() {
                      userPreference.clean();
                      //setState(() {});
                      init();
                    });
                  },
                  icon: const Icon(Icons.delete),
                  label: Text("Limpiar"),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red))),
            ],
          ),
        ),
      ),
    );
  }

  Widget musicCheckbox() {
    final music = ['Rock', 'Pop', 'Salsa', 'Vallenato'];

    return Row(
      children: music
          .map(
            (m) => Checkbox(
                value: true,
                onChanged: (_) {
                  miMusica.add(m);
                  print(miMusica);
                }),
          )
          .toList(),
    );
  }
}
