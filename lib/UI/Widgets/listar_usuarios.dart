import 'package:flutter/material.dart';
import 'package:prueba_de_ingreso/Modelos/usuarios.dart';
import 'package:prueba_de_ingreso/UI/Widgets/card_usuarios.dart';

class ListIsEmpty extends StatelessWidget {
  const ListIsEmpty({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        width: width - 20,
        //color: Colors.red,
        child: const Text(
          'List is Empty',
          textAlign: TextAlign.center,
        ));
  }
}

class ListarUsuarios extends StatelessWidget {
  const ListarUsuarios({
    Key? key,
    required this.usuario,
  }) : super(key: key);

  final List<Usuario> usuario;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemBuilder: (BuildContext context, index) {
          return Cards(
            name: usuario[index].name,
            tel: usuario[index].tel,
            email: usuario[index].email,
            id: usuario[index].id,
          );
        },
        itemCount: usuario.length,
      ),
    );
  }
}
