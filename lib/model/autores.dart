import 'package:biblioteca_api_dart/biblioteca_api_dart.dart';

class Persona extends ManagedObject<Personas> implements Personas {}

class Personas {
  @primaryKey
  int id_persona;

  String nombre_persona;
  String apellido_persona;
  String telefono;
  String dni;
  int edad;

  Autor autores;
}

class Autor extends ManagedObject<Autores> implements Autores {}

class Autores {
  @primaryKey
  int id_autor;

  String nacionalidad;

  @Relate(#autores)
  Persona persona;
}
