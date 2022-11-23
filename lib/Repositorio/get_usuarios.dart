import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:prueba_de_ingreso/Modelos/usuarios.dart';

Future<Object> getUsuarios() async {
  String urix = 'https://jsonplaceholder.typicode.com/users';
  try {
    final response = await http.get(Uri.parse(urix), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    });
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (usuarios.isNotEmpty) {
        usuarios.clear();
      }
      //print(jsonData);
      int i = 0;
      for (var item in jsonData) {
        var usuarioData = Usuario(
            id: item['id'].toString(),
            name: item['name'],
            tel: item['phone'],
            email: item['email']);
        i = i++;
        usuarios.add(usuarioData);
        final box = Hive.box<Usuario>('usuarios');
        box.add(usuarioData);
      }
    }
    print(usuarios);
    return Usuario(id: '1', name: 'a', tel: '1', email: 'a');
  } catch (e) {
    if (e is SocketException) {
      //treat SocketException

      return const ScaffoldMessenger(child: Text('SocketException'));
    } else if (e is TimeoutException) {
      //treat TimeoutException

      return const ScaffoldMessenger(child: Text('TimeoutException'));
    } else {}

    return ScaffoldMessenger(child: Text('$e'));
  }
}
