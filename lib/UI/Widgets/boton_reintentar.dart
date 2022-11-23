import 'package:flutter/material.dart';

class BotonReintentar extends StatelessWidget {
  final VoidCallback onPressed;
  const BotonReintentar(
      {Key? key, required this.mainColor, required this.onPressed})
      : super(key: key);

  final Color mainColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style:
            ButtonStyle(backgroundColor: MaterialStateProperty.all(mainColor)),
        onPressed: onPressed,
        child: const Text(
          'Reintentar',
          style: TextStyle(fontSize: 22, color: Colors.white),
        ));
  }
}
