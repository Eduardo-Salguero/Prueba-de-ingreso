import 'package:flutter/material.dart';
import 'package:prueba_de_ingreso/Modelos/posts.dart';

class ListarPosts extends StatelessWidget {
  const ListarPosts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemBuilder: (BuildContext context, index) {
          return Card(
            child: ListTile(
              tileColor: Colors.white,
              visualDensity: const VisualDensity(vertical: 4),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              title: Text('${posts[index].id}. ${posts[index].title}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  Text(posts[index].body),
                ],
              ),
            ),
          );
        },
        itemCount: posts.length,
      ),
    );
  }
}
