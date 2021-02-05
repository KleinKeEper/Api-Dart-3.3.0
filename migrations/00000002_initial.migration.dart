import 'dart:async';
import 'package:aqueduct/aqueduct.dart';

class Migration1 extends Migration {
  @override
  Future upgrade() async {
    // database.createTable(SchemaTable("Personas", [
    //   SchemaColumn("id_persona", ManagedPropertyType.bigInteger,
    //       isPrimaryKey: true,
    //       autoincrement: true,
    //       isIndexed: false,
    //       isNullable: false,
    //       isUnique: false),
    //   SchemaColumn("nombre_persona", ManagedPropertyType.string,
    //       isPrimaryKey: false,
    //       autoincrement: false,
    //       isIndexed: false,
    //       isNullable: false,
    //       isUnique: false),
    //   SchemaColumn("apellido_persona", ManagedPropertyType.string,
    //       isPrimaryKey: false,
    //       autoincrement: false,
    //       isIndexed: false,
    //       isNullable: false,
    //       isUnique: false),
    //   SchemaColumn("telefono", ManagedPropertyType.string,
    //       isPrimaryKey: false,
    //       autoincrement: false,
    //       isIndexed: false,
    //       isNullable: false,
    //       isUnique: false),
    //   SchemaColumn("dni", ManagedPropertyType.string,
    //       isPrimaryKey: false,
    //       autoincrement: false,
    //       isIndexed: false,
    //       isNullable: false,
    //       isUnique: false),
    //   SchemaColumn("edad", ManagedPropertyType.integer,
    //       isPrimaryKey: false,
    //       autoincrement: false,
    //       isIndexed: false,
    //       isNullable: false,
    //       isUnique: false)
    // ]));
    // database.createTable(SchemaTable("Autores", [
    //   SchemaColumn("id_autor", ManagedPropertyType.bigInteger,
    //       isPrimaryKey: true,
    //       autoincrement: true,
    //       isIndexed: false,
    //       isNullable: false,
    //       isUnique: false),
    //   SchemaColumn("nacionalidad", ManagedPropertyType.string,
    //       isPrimaryKey: false,
    //       autoincrement: false,
    //       isIndexed: false,
    //       isNullable: false,
    //       isUnique: false)
    // ]));
    // database.createTable(SchemaTable("Generos_literarios", [
    //   SchemaColumn("id_genero_literario", ManagedPropertyType.bigInteger,
    //       isPrimaryKey: true,
    //       autoincrement: true,
    //       isIndexed: false,
    //       isNullable: false,
    //       isUnique: false),
    //   SchemaColumn("nombre_genero", ManagedPropertyType.string,
    //       isPrimaryKey: false,
    //       autoincrement: false,
    //       isIndexed: false,
    //       isNullable: false,
    //       isUnique: false)
    // ]));
    database.createTable(SchemaTable("Libro_autores", [
      SchemaColumn("id_libro_autor", ManagedPropertyType.bigInteger,
          isPrimaryKey: true,
          autoincrement: true,
          isIndexed: false,
          isNullable: false,
          isUnique: false)
    ]));
    database.createTable(SchemaTable("Genero_libros", [
      SchemaColumn("id_genero_libro", ManagedPropertyType.bigInteger,
          isPrimaryKey: true,
          autoincrement: true,
          isIndexed: false,
          isNullable: false,
          isUnique: false)
    ]));
    database.createTable(SchemaTable("Libros", [
      SchemaColumn("id_libro", ManagedPropertyType.bigInteger,
          isPrimaryKey: true,
          autoincrement: true,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("nombre_libro", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("editorial", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("fecha_lanzamiento", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("sinopsis", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false),
      SchemaColumn("portada", ManagedPropertyType.string,
          isPrimaryKey: false,
          autoincrement: false,
          isIndexed: false,
          isNullable: false,
          isUnique: false)
    ]));
    // database.addColumn(
    //     "Autores",
    //     SchemaColumn.relationship("persona", ManagedPropertyType.bigInteger,
    //         relatedTableName: "Personas",
    //         relatedColumnName: "id_persona",
    //         rule: DeleteRule.nullify,
    //         isNullable: true,
    //         isUnique: true));
    database.addColumn(
        "Libro_autores",
        SchemaColumn.relationship("autor", ManagedPropertyType.bigInteger,
            relatedTableName: "Autores",
            relatedColumnName: "id_autor",
            rule: DeleteRule.nullify,
            isNullable: true,
            isUnique: true));
    database.addColumn(
        "Libro_autores",
        SchemaColumn.relationship("libro", ManagedPropertyType.bigInteger,
            relatedTableName: "Libros",
            relatedColumnName: "id_libro",
            rule: DeleteRule.nullify,
            isNullable: true,
            isUnique: true));
    database.addColumn(
        "Genero_libros",
        SchemaColumn.relationship(
            "genero_literario", ManagedPropertyType.bigInteger,
            relatedTableName: "Generos_literarios",
            relatedColumnName: "id_genero_literario",
            rule: DeleteRule.nullify,
            isNullable: true,
            isUnique: true));
    database.addColumn(
        "Genero_libros",
        SchemaColumn.relationship("libro", ManagedPropertyType.bigInteger,
            relatedTableName: "Libros",
            relatedColumnName: "id_libro",
            rule: DeleteRule.nullify,
            isNullable: true,
            isUnique: true));
  }

  @override
  Future downgrade() async {}

  @override
  Future seed() async {}
}
