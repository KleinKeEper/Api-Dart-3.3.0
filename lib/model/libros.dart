import 'package:biblioteca_api_dart/biblioteca_api_dart.dart';
import 'package:biblioteca_api_dart/model/genero_libros.dart';
import 'package:biblioteca_api_dart/model/libro_autores.dart';

class Libro extends ManagedObject<Libros> implements Libros {}

class Libros {
  @primaryKey
  int id_libro;

  @Column()
  String nombre_libro;
  @Column()
  String editorial;

  String fecha_lanzamiento;
  String sinopsis;
  String portada;

  Genero_libro genero_libros;
  Libro_autor libro_autores;
}
