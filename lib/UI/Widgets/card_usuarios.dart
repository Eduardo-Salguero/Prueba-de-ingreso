import 'package:flutter/material.dart';
import 'package:prueba_de_ingreso/BLoC/use_cases.dart';
import 'package:prueba_de_ingreso/UI/Screens/screen_publicaciones.dart';
import 'package:prueba_de_ingreso/variables_globales.dart';

class Cards extends StatelessWidget {
  final String name;
  final String tel;
  final String email;
  final String id;
  const Cards(
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
    //double heigh = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      elevation: 2,
      child: Container(
        width: width - 20,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20, color: mainColor),
            ),
            Row(
              children: [
                Icon(
                  telIcon,
                  color: mainColor,
                  size: 24,
                ),
                const SizedBox(
                  width: 7,
                ),
                Text(
                  tel,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  emailIcon,
                  color: mainColor,
                  size: 24,
                ),
                const SizedBox(
                  width: 7,
                ),
                Text(
                  email,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                TextButton(
                  onPressed: () async {
                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                    metodoHayInternet();
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => Publicaciones(
                          id: id,
                          name: name,
                          tel: tel,
                          email: email,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    'VER PUBLICACIONES',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: mainColor),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
