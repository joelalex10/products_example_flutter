import 'package:drift/drift.dart';

class Products extends Table{
  IntColumn get codigo => integer().named('codigo')();
  TextColumn get nombre => text().withLength(min:1, max: 45).named('nombre')();
  RealColumn get precio => real().named('precio')();
  IntColumn get existencias => integer().named('existencias')();
  TextColumn get descripcion => text().named('descripcion')();
  DateTimeColumn get fechaIngreso => dateTime().nullable().named('fecha_ingreso')();
  @override
  Set<Column> get primaryKey => {codigo};
}