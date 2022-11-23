import 'package:flutter/material.dart';

class DatosUsuario extends StatelessWidget {
  const DatosUsuario({
    Key? key,
    required this.telIcon,
    required this.mainColor,
    required this.tel,
    required this.emailIcon,
    required this.email,
  }) : super(key: key);

  final IconData telIcon;
  final Color mainColor;
  final String tel;
  final IconData emailIcon;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
      ],
    );
  }
}
