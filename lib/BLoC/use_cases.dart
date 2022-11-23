import 'package:prueba_de_ingreso/Modelos/posts.dart';
import 'package:prueba_de_ingreso/Modelos/usuarios.dart';
import 'package:prueba_de_ingreso/Repositorio/get_posts.dart';
import 'package:prueba_de_ingreso/Repositorio/get_usuarios.dart';
import 'dart:async';

//1. Cargar la información de los usuarios
Stream<Usuario> loadUsuarios() async* {
  await getUsuarios();
  yield Usuario(id: '1', name: 'a', tel: '1', email: 'a');
}

//2. Cargar la información de las publicaciones del usuario correspondiente
Stream<Post> loadPublicaciones(String id) async* {
  await getPosts(id);
  yield Post(userId: '1', id: '1', title: 'a', body: 'a');
}
