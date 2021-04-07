import 'package:flutter/material.dart';
import 'package:local_storage/helpers/user_preference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  UserPreference userPreference = new UserPreference();
  await userPreference.initPrefers();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Almacenamiento local"),
        ),
        body: Container(
          padding: EdgeInsets.all(8),
          child: Column(children: [
            TextField(
              decoration: InputDecoration(contentPadding: EdgeInsets.all(4), hintText: "Nombre"),
              onChanged: (String valueNombre) {
                print(valueNombre);
              },
            ),
            TextField(
              decoration: InputDecoration(contentPadding: EdgeInsets.all(4), hintText: "Apellido"),
              onChanged: (String valueApellido) {
                print(valueApellido);
              },
            ),
            TextField(
              decoration: InputDecoration(contentPadding: EdgeInsets.all(4), hintText: "Nombre"),
              onChanged: (String valueEdad) {
                print(valueEdad);
              },
            ),
            DropdownButton(
              value: false, //Valor por defecto
              isExpanded: true,
              items: [
                DropdownMenuItem(child: Text("Casado"), value: true,),
                DropdownMenuItem(child: Text("Soltero"), value: false,),
              ], 
              onChanged: (bool valueCasado) {
                  print(valueCasado);
              }
            ),
          ],),
        ),
      ),
    );
  }
}
