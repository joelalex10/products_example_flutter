import 'package:drift/drift.dart';
import 'package:productos/models/category.dart';
import 'package:productos/models/product.dart';

class CategoryProduct extends Table{
  IntColumn get categoryId => integer().named('category_id').references(Category, #id)();
  IntColumn get productId => integer().named('product_id').references(Products, #codigo)();
  @override
  Set<Column> get primaryKey => {productId,categoryId};
}