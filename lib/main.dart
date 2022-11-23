import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:prueba_de_ingreso/BLoC/use_cases.dart';
import 'package:prueba_de_ingreso/Modelos/usuarios.dart';
import 'package:prueba_de_ingreso/UI/Screens/screen_busqueda.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(UsuarioAdapter());
  await Hive.openBox<Usuario>('usuarios');
  await metodoHayInternet();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba de Ingreso',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const ScreenBusqueda(),
    );
  }
}
