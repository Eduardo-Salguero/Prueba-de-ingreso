import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:prueba_de_ingreso/Modelos/posts.dart';

Future<Object> getPosts(String id) async {
  String urix = 'https://jsonplaceholder.typicode.com/posts?userId=$id';
  try {
    final response = await http.get(Uri.parse(urix), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
    });
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (posts.isNotEmpty) {
        posts.clear();
      }
      //print(jsonData);
      int i = 0;
      for (var item in jsonData) {
        var postData = Post(
            userId: item['userId'].toString(),
            id: item['id'].toString(),
            title: item['title'],
            body: item['body']);
        i = i++;
        posts.add(postData);
      }
    }
    print(posts);
    return Post(userId: '1', id: '1', title: 'a', body: 'a');
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
