import 'package:drift/drift.dart';
import 'package:productos/database/database.dart';
import 'package:productos/dto/product_dto.dart';
import 'package:productos/models/product.dart';

part 'product_dao.g.dart';

@DriftAccessor(tables: [Products])
class ProductDao extends DatabaseAccessor<AppDb>
    with _$ProductDaoMixin {
  ProductDao(AppDb db) : super(db);

  Future insertProduct(ProductDto dto) {
    final productCompanion = ProductsCompanion(
      codigo: Value(dto.codigoProducto),
      nombre: Value(dto.nombre),
      precio: Value(dto.precio),
      existencias: Value(dto.existencias),
      descripcion: Value(dto.descripcion),
      fechaIngreso: Value(dto.fechaIngreso),
    );
    return into(products).insert(productCompanion);
  }

  Future<List<ProductDto>> selectAllProducts() async {
    final result = await (select(products).get());
    return result.map((row) {
      return ProductDto(codigoProducto: row.codigo,
          nombre: row.nombre,
          precio: row.precio,
          existencias: row.existencias,
          descripcion: row.descripcion,
          fechaIngreso: row.fechaIngreso!);
    }).toList();
  }

}