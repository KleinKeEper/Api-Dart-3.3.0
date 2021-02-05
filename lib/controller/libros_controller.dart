import 'package:biblioteca_api_dart/biblioteca_api_dart.dart';
import 'package:biblioteca_api_dart/model/libros.dart';

class LibroController extends ResourceController {
  LibroController(this.context);
  ManagedContext context;

  @Operation.get()
  Future<Response> getAllLibros() async {
    final query = Query<Libro>(context);
    return Response.ok(await query.fetch());
  }

  @Operation.get('id')
  Future<Response> getLibro(@Bind.path('id') int id) async {
    final query = Query<Libro>(context)..where((x) => x.id_libro).equalTo(id);
    final match = await query.fetchOne();
    if (match == null) {
      return Response.notFound(body: 'Book not found');
    }
    return Response.ok(match);
  }

  @Operation.post()
  Future<Response> insertLibro(@Bind.body() Libro libro) async {
    final query = Query<Libro>(context)..values = libro;
    return Response.ok(await query.insert());
  }

  @Operation.put('id')
  Future<Response> updateLibro(
      @Bind.body() Libro libro, @Bind.path('id') int id) async {
    final query = Query<Libro>(context)
      ..values = libro
      ..where((x) => x.id_libro).equalTo(id);

    final updateLibro = await query.updateOne();
    if (updateLibro == null) {
      Response.notFound(body: 'Item not found');
    }
    return Response.ok(updateLibro);
  }

  @Operation.delete('id')
  Future<Response> deleteLibro(@Bind.path('id') int id) async {
    final query = Query<Libro>(context)..where((x) => x.id_libro).equalTo(id);
    final delete = await query.delete();

    if (delete == 0) {
      return Response.notFound(body: 'Book not found');
    }
    return Response.ok(delete);
  }
}
