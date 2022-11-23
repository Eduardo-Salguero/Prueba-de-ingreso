import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'usuarios.g.dart';

@HiveType(typeId: 1)
class Usuario extends HiveObject {
  @HiveField(0)
  late String id;
  @HiveField(1)
  late String name;
  @HiveField(2)
  late String tel;
  @HiveField(3)
  late String email;

  Usuario(
      {required this.id,
      required this.name,
      required this.tel,
      required this.email});
}

List<Usuario> usuarios = [];
