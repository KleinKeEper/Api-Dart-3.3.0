import 'package:biblioteca_api_dart/biblioteca_api_dart.dart';
import 'package:biblioteca_api_dart/model/genero_libros.dart';

class Genero_literario extends ManagedObject<Generos_literarios>
    implements Generos_literarios {
  // @Serialize()
  // String get detail => 'Name $nombre_genero';
}

class Generos_literarios {
  @primaryKey
  int id_genero_literario;

  @Column()
  String nombre_genero;

  Genero_libro genero_libros;
}
