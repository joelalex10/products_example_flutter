import 'package:drift/drift.dart';
import 'package:productos/database/database.dart';
import 'package:productos/dto/marca_list_dto.dart';
import 'package:productos/dto/product_dto.dart';
import 'package:productos/models/product.dart';
import 'package:productos/util/log.dart';

part 'product_dao.g.dart';

@DriftAccessor(tables: [Products])
class ProductDao extends DatabaseAccessor<AppDb> with _$ProductDaoMixin {
  static const TAG = 'ProductDao';

  ProductDao(AppDb db) : super(db);

  Future insertProduct(ProductDto dto) {
    Log.d(TAG, 'Insertando producto con dto: ${dto.toString()}');
    final productCompanion = ProductsCompanion(
      codigo: Value(dto.codigoProducto),
      nombre: Value(dto.nombre),
      precio: Value(dto.precio),
      existencias: Value(dto.existencias),
      descripcion: Value(dto.descripcion),
      fechaIngreso: Value(dto.fechaIngreso),
      isAvailable: const Value(1),
    );
    return into(products).insert(productCompanion);
  }

  Future<List<ProductDto>?> selectAllProducts() async {
    Log.i(TAG, 'Seleccionando todos los productos');
    try {
      final result = await (select(products).get());
      Log.i(TAG, '${result.length} productos encontrados');
      return result.map((row) {
        return ProductDto(
          codigoProducto: row.codigo,
          nombre: row.nombre,
          precio: row.precio,
          existencias: row.existencias,
          descripcion: row.descripcion,
          fechaIngreso: row.fechaIngreso!,
          isAvailable: row.isAvailable,
        );
      }).toList();
    } catch (e) {
      Log.e(TAG, 'Error seleccionando productos: $e');
      return null;
    }
  }

  Future<List<ProductDto>?> selectProductsByBrand(String brand) async {
    Log.i(TAG, 'Seleccionando los productos por la marca $brand');
    try {
      final result =
          await (select(products)
            ..where((t) => t.marca.equals(brand))
            ..orderBy([
                  (t) => OrderingTerm(
                  expression: t.isAvailable.equals(1),
                  mode: OrderingMode.desc)
            ])
          ).get();
      Log.i(TAG, '${result.length} productos encontrados');
      return result.map((row) {
        return ProductDto(
          codigoProducto: row.codigo,
          nombre: row.nombre,
          precio: row.precio,
          existencias: row.existencias,
          descripcion: row.descripcion,
          fechaIngreso: row.fechaIngreso!,
          isAvailable: row.isAvailable,
        );
      }).toList();
    } catch (e) {
      Log.e(TAG, 'Error seleccionando productos: $e');
      return null;
    }
  }

  Future<List<MarcaListDto>> selectTotalProductsByBrand() async {
    Log.i(TAG, 'Se seleccionaran los productos por la marca');
    final marcaAlias = products.marca;
    final countAlias = products.codigo.count();
    final registerProductAlias = products.isAvailable.count(
        filter: products.isAvailable.equals(1)
    );
    final query = await selectOnly(products)
      ..addColumns([
        marcaAlias,
        countAlias,
        registerProductAlias
      ])
      ..groupBy([products.marca])
      ..orderBy(
          [OrderingTerm(expression: countAlias, mode: OrderingMode.desc)]);
    final result = await query.map((row) {
      return MarcaListDto(
          marcaProducto: row.read(marcaAlias)!,
      totalProductosDisponibles: row.read(registerProductAlias)!,
      totalProductosNoDisponibles:row.read(countAlias)! - row.read(registerProductAlias)!
      );
    }).get();
    return result;
  }

  Future<bool> updateIsAvailable(int codigo, int isAvailable) async {
    Log.d(TAG,
        'Actualizando disponibilidad con codigo: $codigo, isAvailable: $isAvailable');
    try {
      final result = await (update(products)
            ..where((tbl) => tbl.codigo.equals(codigo)))
          .write(ProductsCompanion(
        isAvailable: Value(isAvailable),
      ));
      Log.i(TAG, 'Disponibilidad actualizada: $result');
      return result > 0;
    } catch (e) {
      Log.e(TAG, 'Error actualizando disponibilidad: $e');
      return false;
    }
  }
}
