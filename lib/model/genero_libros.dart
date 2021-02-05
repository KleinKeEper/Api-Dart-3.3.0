import 'package:biblioteca_api_dart/biblioteca_api_dart.dart';
import 'package:biblioteca_api_dart/model/generos_literarios.dart';
import 'package:biblioteca_api_dart/model/libros.dart';

class Genero_libro extends ManagedObject<Genero_libros>
    implements Genero_libros {}

class Genero_libros {
  @primaryKey
  int id_genero_libro;

  @Relate(#genero_libros)
  Genero_literario genero_literario;

  @Relate(#genero_libros)
  Libro libro;
}
