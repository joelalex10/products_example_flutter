import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:productos/dao/product_dao.dart';
import 'package:productos/models/category.dart';
import 'package:productos/models/category_product.dart';
import 'package:productos/models/product.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
part 'database.g.dart';

@DriftDatabase(
    tables: [
      Products,
      Category,
      CategoryProduct,
    ],
  daos: [
    ProductDao
  ]
)
class AppDb extends _$AppDb{
  AppDb(): super(_openConnection());
  @override
  int get schemaVersion => 1;
  Future<int> checkForeignKeys() async {
    final result = await customSelect(
      'PRAGMA foreign_keys;',
    ).getSingle(); // Obtén el único resultado esperado.

    // Asume que el resultado tiene una columna llamada 'foreign_keys' y es un int.
    return result.read<int>('foreign_keys');
  }
  Future<void> enableForeignKeys() async {
    await customStatement('PRAGMA foreign_keys = ON;');
  }
}
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'dbProductos.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
