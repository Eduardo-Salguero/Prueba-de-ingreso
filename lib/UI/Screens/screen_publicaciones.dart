import 'package:flutter/material.dart';
import 'package:prueba_de_ingreso/BLoC/use_cases.dart';
import 'package:prueba_de_ingreso/Modelos/posts.dart';
import 'package:prueba_de_ingreso/UI/Widgets/datos_usuario.dart';
import 'package:prueba_de_ingreso/UI/Widgets/listar_posts.dart';

class Publicaciones extends StatelessWidget {
  final String name;
  final String tel;
  final String email;
  final String id;
  const Publicaciones(
      {Key? key,
      required this.name,
      required this.tel,
      required this.email,
      required this.id})
      : super(
          key: key,
        );

  final IconData telIcon = Icons.phone;
  final IconData emailIcon = Icons.email;
  final Color mainColor = const Color(0xff2c5d33);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Publicaciones'),
        backgroundColor: const Color(0xff2c5d33),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Text(
            name,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 22, color: mainColor),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            width: width - 30,
            child: DatosUsuario(
                telIcon: telIcon,
                mainColor: mainColor,
                tel: tel,
                emailIcon: emailIcon,
                email: email),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Publicaciones',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: mainColor,
              ),
            ),
          ),
          StreamBuilder<Post>(
              stream: loadPublicaciones(id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return const ListarPosts();
                } else {
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        width: width - 20,
                        height: 15,
                      ),
                      const CircularProgressIndicator(),
                    ],
                  );
                }
              })
        ],
      ),
    );
  }
}
