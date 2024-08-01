import 'package:drift/drift.dart';

class Category extends Table{
  IntColumn get id => integer().autoIncrement().named('id')();
  TextColumn get description => text().named('categoria')();

}