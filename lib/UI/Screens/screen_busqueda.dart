import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:prueba_de_ingreso/BLoC/use_cases.dart';
import 'package:prueba_de_ingreso/Modelos/usuarios.dart';
import 'package:prueba_de_ingreso/UI/Widgets/listar_usuarios.dart';

class ScreenBusqueda extends StatefulWidget {
  const ScreenBusqueda({Key? key}) : super(key: key);

  @override
  State<ScreenBusqueda> createState() => _ScreenBusquedaState();
}

class _ScreenBusquedaState extends State<ScreenBusqueda> {
  late Box usuariosBox;
  @override
  // ignore: must_call_super
  void initState() {
    // ignore: todo
    // TODO: implement initState
    usuariosBox = Hive.box<Usuario>('usuarios');
    if (usuariosBox.isNotEmpty) {
      for (var i = 0; i < usuariosBox.length; i++) {
        var usuarioData = usuariosBox.get(i);
        usuarios.add(usuarioData!);
        usuario = usuarios;
      }
    }
  }

  Color mainColor = const Color(0xff2c5d33);
  final controller = TextEditingController();
  bool hasTyped = false;
  List<Usuario> usuario = [];
  @override
  Widget build(BuildContext context) {
    //double heigh = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: const Color(0Xfff6f6f3),
          appBar: AppBar(
            title: const Text('Prueba de Ingreso'),
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xff2c5d33),
          ),
          body: Column(children: [
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller,
              onChanged: filtrar,
              cursorColor: mainColor,
              decoration: InputDecoration(
                isDense: true,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: mainColor, width: 2)),
                focusColor: mainColor,
                labelStyle: TextStyle(color: mainColor),
                constraints: BoxConstraints(maxWidth: width - 30),
                labelText: 'Buscar Usuario',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            usuarios.isEmpty
                ? StreamBuilder<Usuario>(
                    stream: loadUsuarios(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        print('data de internet');
                        if (usuario.isEmpty && hasTyped == false) {
                          usuario = usuarios;
                        }

                        return usuario.isNotEmpty
                            ? ListarUsuarios(usuario: usuario)
                            : ListIsEmpty(width: width);
                      } else {
                        return const LinearProgressIndicator();
                      }
                    })
                : usuario.isNotEmpty
                    ? ListarUsuarios(usuario: usuario)
                    : ListIsEmpty(width: width)
          ]),
        ));
  }

  void filtrar(String consulta) {
    final busqueda = usuarios.where((usuario) {
      final nombre = usuario.name.toLowerCase();
      final input = consulta.toLowerCase();
      if (input.isNotEmpty) {
        hasTyped = true;
      }
      return nombre.contains(input);
    }).toList();

    setState(() {
      usuario = busqueda;
    });
  }
}
