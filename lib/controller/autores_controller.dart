import 'package:biblioteca_api_dart/biblioteca_api_dart.dart';
import 'package:biblioteca_api_dart/model/autores.dart';

class AutoresController extends ResourceController {
  AutoresController(this.context);
  ManagedContext context;

  @Operation.get()
  Future<Response> getAllAutores() async {
    final query = Query<Autor>(context)..join(object: (x) => x.persona);
    return Response.ok(await query.fetch());
  }

  @Operation.get('id')
  Future<Response> getAutor(@Bind.path('id') int id) async {
    final query = Query<Autor>(context)
      ..join(object: (x) => x.persona)
      ..where((x) => x.id_autor).equalTo(id);
    final fetch = await query.fetchOne();

    if (fetch == null) {
      return Response.notFound(body: 'author not found');
    }
    return Response.ok(fetch);
  }

  @Operation.post()
  Future<Response> insertAutor(@Bind.body() Autor autor) async {
    final query = Query<Autor>(context)..values = autor;

    return Response.ok(query.insert());
  }

  @Operation.delete('id')
  Future<Response> deleteAuthor(@Bind.path('id') int id) async {
    final query = Query<Autor>(context)..where((x) => x.id_autor).equalTo(id);
    final fetch = await query.delete();
    if (fetch == 0) {
      return Response.notFound(body: 'Author not found');
    }
    return Response.ok(fetch);
  }

  @Operation.put('id')
  Future<Response> updateAuthor(
      @Bind.body() Autor autor, @Bind.path('id') int id) async {
    final query = Query<Autor>(context)
      ..where((author) => author.id_autor).equalTo(id)
      ..values = autor;
    final fetch = query.updateOne();

    if (fetch == null) {
      return Response.notFound(body: 'Authot not found');
    }
    return Response.ok(fetch);
  }

  // @Operation.get()
  // Future<Response> getAllPersonas() async {
  //   final query = Query<Persona>(context)..join(object: (a) => a.autores);
  //   return Response.ok(await query.fetch());
  // }
}
