import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:prueba_de_ingreso/Modelos/posts.dart';
import 'package:prueba_de_ingreso/Modelos/usuarios.dart';
import 'package:prueba_de_ingreso/Repositorio/get_posts.dart';
import 'package:prueba_de_ingreso/Repositorio/get_usuarios.dart';
import 'dart:async';

import 'package:prueba_de_ingreso/variables_globales.dart';

//1. Cargar la información de los usuarios
Stream<Usuario> loadUsuarios() async* {
  await getUsuarios();
  if (hayInternet) {
    yield Usuario(id: '1', name: 'a', tel: '1', email: 'a');
  }
}

//2. Cargar la información de las publicaciones del usuario correspondiente
Stream<Post> loadPublicaciones(String id) async* {
  //if (hayInternet) {
  await getPosts(id);
  if (hayInternet) {
    yield Post(userId: '1', id: '1', title: 'a', body: 'a');
  }

  // }
}

//3. Verificar conexión a internet
metodoHayInternet() async {
  hayInternet = await InternetConnectionChecker().hasConnection;
  return hayInternet;
}
