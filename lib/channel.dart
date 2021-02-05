import 'package:biblioteca_api_dart/controller/autores_controller.dart';
import 'package:biblioteca_api_dart/controller/generos_literarios_controller.dart';
import 'package:biblioteca_api_dart/controller/libro_autores_controller.dart';
import 'package:biblioteca_api_dart/controller/libros_controller.dart';

import 'biblioteca_api_dart.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class BibliotecaApiDartChannel extends ApplicationChannel {
  ManagedContext context;

  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    final config = BibliotecaConfig(options.configurationFilePath);
    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
        config.database.username,
        config.database.password,
        config.database.host,
        config.database.port,
        config.database.databaseName);
    context = ManagedContext(dataModel, persistentStore);
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  // @override
  // Controller get entryPoint {
  //   final router = Router();

  //   // Prefer to use `link` instead of `linkFunction`.
  //   // See: https://aqueduct.io/docs/http/request_controller/
  //   router.route("/example").linkFunction((request) async {
  //     return Response.ok({"key": "value"});
  //   });

  //   return router;
  // }

  @override
  Controller get entryPoint => Router()
    ..route("/generos/[:id]").link(() => GenerosConteller(context))
    ..route("/autores/[:id]").link(() => AutoresController(context))
    ..route("/libro_autores/[:id]").link(() => LibrosAutoresController(context))
    ..route("/libros/[:id]").link(() => LibroController(context))
    ..route("/").linkFunction((request) => Response.ok({"key": "value"}));
}

class BibliotecaConfig extends Configuration {
  BibliotecaConfig(String path) : super.fromFile(File(path));
  DatabaseConfiguration database;
}
