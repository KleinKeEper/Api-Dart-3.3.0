import 'package:biblioteca_api_dart/biblioteca_api_dart.dart';
import 'package:biblioteca_api_dart/model/autores.dart';
import 'package:biblioteca_api_dart/model/libro_autores.dart';

class LibrosAutoresController extends ResourceController {
  LibrosAutoresController(this.context);
  ManagedContext context;

  @Operation.get()
  Future<Response> getAllLibroAutores() async {
    final query = Query<Libro_autor>(context)
      // ..join(object: (a) => a.autor)
      ..join(object: (l) => l.libro);
    // ..join(object: (p) => p.autor.persona.id_persona);

    return Response.ok(await query.fetch());
  }

  @Operation.get('id')
  Future<Response> getLibroAutor(@Bind.path('id') int id) async {
    final query = Query<Libro_autor>(context)
      ..join(object: (l) => l.libro)
      ..where((x) => x.id_libro_autor).equalTo(id);

    // ignore: unused_local_variable
    final bquery = query.join(object: (a) => a.autor)
      ..join(object: (p) => p.persona);

    // final query = Query<Libro_autor>(context)
    //   ..join(object: (l) => l.libro)
    //   ..join(object: (a) => a.autor)
    //   ..where((x) => x.id_libro_autor).equalTo(id);

    final match = await query.fetch();

    if (match == null) {
      return Response.notFound(body: 'Item not found');
    }
    return Response.ok(match);
  }

  @Operation.post()
  Future<Response> insertLibroAutores(
      @Bind.body() Libro_autor libroAutor) async {
    final query = Query<Libro_autor>(context)..values = libroAutor;
    return Response.ok(await query.insert());
  }
}
