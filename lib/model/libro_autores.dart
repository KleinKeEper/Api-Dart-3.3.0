import 'package:biblioteca_api_dart/biblioteca_api_dart.dart';
import 'package:biblioteca_api_dart/model/autores.dart';
import 'package:biblioteca_api_dart/model/libros.dart';

class Libro_autor extends ManagedObject<Libro_autores>
    implements Libro_autores {}

class Libro_autores {
  @primaryKey
  int id_libro_autor;

  @Relate(#libro_autores)
  Autor autor;

  @Relate(#libro_autores)
  Libro libro;
}
