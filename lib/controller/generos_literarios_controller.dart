import 'package:biblioteca_api_dart/biblioteca_api_dart.dart';
import 'package:biblioteca_api_dart/model/generos_literarios.dart';

class GenerosConteller extends ResourceController {
  GenerosConteller(this.context);
  ManagedContext context;

  @Operation.get()
  Future<Response> getAllGenre() async {
    final generoQuery = Query<Genero_literario>(context);
    print(generoQuery);
    return Response.ok(await generoQuery.fetch());
  }

  @Operation.get('id')
  Future<Response> getGenero(@Bind.path('id') int id) async {
    print('id $id');
    final genreQuery = Query<Genero_literario>(context)
      ..where((generos_literarios) => generos_literarios.id_genero_literario)
          .equalTo(id);

    final genre = await genreQuery.fetchOne();
    if (genre == null) {
      return Response.notFound(body: 'Genre not found');
    }
    return Response.ok(genre);
  }

  @Operation.post()
  Future<Response> insertNewGenre(
      @Bind.body() Genero_literario genero_literario) async {
    final genreQuery = Query<Genero_literario>(context)
      ..values = genero_literario;
    final insertGenre = await genreQuery.insert();

    return Response.ok(insertGenre);
  }

  @Operation.delete('id')
  Future<Response> deleteGenre(@Bind.path('id') int id) async {
    final genreQuery = Query<Genero_literario>(context)
      ..where((genre) => genre.id_genero_literario).equalTo(id);

    final genre = await genreQuery.delete();

    if (genre == 0) {
      return Response.notFound(body: 'genre nor found');
    }

    return Response.ok('Delete $genre genres');
  }

  @Operation.put('id')
  Future<Response> updateGenre(@Bind.body() Genero_literario genero_literario,
      @Bind.path('id') int id) async {
    final genreQuery = Query<Genero_literario>(context)
      ..values = genero_literario
      ..where((genre) => genre.id_genero_literario).equalTo(id);

    final updateGenre = await genreQuery.updateOne();

    if (updateGenre == null) {
      return Response.notFound(body: 'Genre not found, not update');
    }

    return Response.ok(updateGenre);
  }
}
