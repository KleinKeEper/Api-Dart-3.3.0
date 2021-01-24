import 'package:biblioteca_api_dart/biblioteca_api_dart.dart';
import 'package:biblioteca_api_dart/model/autores.dart';

class AutoresController extends ResourceController {
  AutoresController(this.context);
  ManagedContext context;

  @Operation.get()
  Future<Response> getAllAutores() async {
    final query = Query<Autor>(context);
    return Response.ok(await query.fetch());
  }

  // @Operation.get()
  // Future<Response> getAllPersonas() async {
  //   final query = Query<Persona>(context)..join(object: (a) => a.autores);
  //   return Response.ok(await query.fetch());
  // }
}
