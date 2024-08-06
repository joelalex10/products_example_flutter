// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ProductsTable extends Products with TableInfo<$ProductsTable, Product> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _codigoMeta = const VerificationMeta('codigo');
  @override
  late final GeneratedColumn<int> codigo = GeneratedColumn<int>(
      'codigo', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
      'nombre', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 45),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _precioMeta = const VerificationMeta('precio');
  @override
  late final GeneratedColumn<double> precio = GeneratedColumn<double>(
      'precio', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _existenciasMeta =
      const VerificationMeta('existencias');
  @override
  late final GeneratedColumn<int> existencias = GeneratedColumn<int>(
      'existencias', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _descripcionMeta =
      const VerificationMeta('descripcion');
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
      'descripcion', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isAvailableMeta =
      const VerificationMeta('isAvailable');
  @override
  late final GeneratedColumn<int> isAvailable = GeneratedColumn<int>(
      'is_available', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _marcaMeta = const VerificationMeta('marca');
  @override
  late final GeneratedColumn<String> marca = GeneratedColumn<String>(
      'marca', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _fechaIngresoMeta =
      const VerificationMeta('fechaIngreso');
  @override
  late final GeneratedColumn<DateTime> fechaIngreso = GeneratedColumn<DateTime>(
      'fecha_ingreso', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        codigo,
        nombre,
        precio,
        existencias,
        descripcion,
        isAvailable,
        marca,
        fechaIngreso
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products';
  @override
  VerificationContext validateIntegrity(Insertable<Product> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('codigo')) {
      context.handle(_codigoMeta,
          codigo.isAcceptableOrUnknown(data['codigo']!, _codigoMeta));
    }
    if (data.containsKey('nombre')) {
      context.handle(_nombreMeta,
          nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta));
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    if (data.containsKey('precio')) {
      context.handle(_precioMeta,
          precio.isAcceptableOrUnknown(data['precio']!, _precioMeta));
    } else if (isInserting) {
      context.missing(_precioMeta);
    }
    if (data.containsKey('existencias')) {
      context.handle(
          _existenciasMeta,
          existencias.isAcceptableOrUnknown(
              data['existencias']!, _existenciasMeta));
    } else if (isInserting) {
      context.missing(_existenciasMeta);
    }
    if (data.containsKey('descripcion')) {
      context.handle(
          _descripcionMeta,
          descripcion.isAcceptableOrUnknown(
              data['descripcion']!, _descripcionMeta));
    } else if (isInserting) {
      context.missing(_descripcionMeta);
    }
    if (data.containsKey('is_available')) {
      context.handle(
          _isAvailableMeta,
          isAvailable.isAcceptableOrUnknown(
              data['is_available']!, _isAvailableMeta));
    } else if (isInserting) {
      context.missing(_isAvailableMeta);
    }
    if (data.containsKey('marca')) {
      context.handle(
          _marcaMeta, marca.isAcceptableOrUnknown(data['marca']!, _marcaMeta));
    }
    if (data.containsKey('fecha_ingreso')) {
      context.handle(
          _fechaIngresoMeta,
          fechaIngreso.isAcceptableOrUnknown(
              data['fecha_ingreso']!, _fechaIngresoMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {codigo};
  @override
  Product map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Product(
      codigo: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}codigo'])!,
      nombre: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}nombre'])!,
      precio: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}precio'])!,
      existencias: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}existencias'])!,
      descripcion: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}descripcion'])!,
      isAvailable: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}is_available'])!,
      marca: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}marca']),
      fechaIngreso: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}fecha_ingreso']),
    );
  }

  @override
  $ProductsTable createAlias(String alias) {
    return $ProductsTable(attachedDatabase, alias);
  }
}

class Product extends DataClass implements Insertable<Product> {
  final int codigo;
  final String nombre;
  final double precio;
  final int existencias;
  final String descripcion;
  final int isAvailable;
  final String? marca;
  final DateTime? fechaIngreso;
  const Product(
      {required this.codigo,
      required this.nombre,
      required this.precio,
      required this.existencias,
      required this.descripcion,
      required this.isAvailable,
      this.marca,
      this.fechaIngreso});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['codigo'] = Variable<int>(codigo);
    map['nombre'] = Variable<String>(nombre);
    map['precio'] = Variable<double>(precio);
    map['existencias'] = Variable<int>(existencias);
    map['descripcion'] = Variable<String>(descripcion);
    map['is_available'] = Variable<int>(isAvailable);
    if (!nullToAbsent || marca != null) {
      map['marca'] = Variable<String>(marca);
    }
    if (!nullToAbsent || fechaIngreso != null) {
      map['fecha_ingreso'] = Variable<DateTime>(fechaIngreso);
    }
    return map;
  }

  ProductsCompanion toCompanion(bool nullToAbsent) {
    return ProductsCompanion(
      codigo: Value(codigo),
      nombre: Value(nombre),
      precio: Value(precio),
      existencias: Value(existencias),
      descripcion: Value(descripcion),
      isAvailable: Value(isAvailable),
      marca:
          marca == null && nullToAbsent ? const Value.absent() : Value(marca),
      fechaIngreso: fechaIngreso == null && nullToAbsent
          ? const Value.absent()
          : Value(fechaIngreso),
    );
  }

  factory Product.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Product(
      codigo: serializer.fromJson<int>(json['codigo']),
      nombre: serializer.fromJson<String>(json['nombre']),
      precio: serializer.fromJson<double>(json['precio']),
      existencias: serializer.fromJson<int>(json['existencias']),
      descripcion: serializer.fromJson<String>(json['descripcion']),
      isAvailable: serializer.fromJson<int>(json['isAvailable']),
      marca: serializer.fromJson<String?>(json['marca']),
      fechaIngreso: serializer.fromJson<DateTime?>(json['fechaIngreso']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'codigo': serializer.toJson<int>(codigo),
      'nombre': serializer.toJson<String>(nombre),
      'precio': serializer.toJson<double>(precio),
      'existencias': serializer.toJson<int>(existencias),
      'descripcion': serializer.toJson<String>(descripcion),
      'isAvailable': serializer.toJson<int>(isAvailable),
      'marca': serializer.toJson<String?>(marca),
      'fechaIngreso': serializer.toJson<DateTime?>(fechaIngreso),
    };
  }

  Product copyWith(
          {int? codigo,
          String? nombre,
          double? precio,
          int? existencias,
          String? descripcion,
          int? isAvailable,
          Value<String?> marca = const Value.absent(),
          Value<DateTime?> fechaIngreso = const Value.absent()}) =>
      Product(
        codigo: codigo ?? this.codigo,
        nombre: nombre ?? this.nombre,
        precio: precio ?? this.precio,
        existencias: existencias ?? this.existencias,
        descripcion: descripcion ?? this.descripcion,
        isAvailable: isAvailable ?? this.isAvailable,
        marca: marca.present ? marca.value : this.marca,
        fechaIngreso:
            fechaIngreso.present ? fechaIngreso.value : this.fechaIngreso,
      );
  Product copyWithCompanion(ProductsCompanion data) {
    return Product(
      codigo: data.codigo.present ? data.codigo.value : this.codigo,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      precio: data.precio.present ? data.precio.value : this.precio,
      existencias:
          data.existencias.present ? data.existencias.value : this.existencias,
      descripcion:
          data.descripcion.present ? data.descripcion.value : this.descripcion,
      isAvailable:
          data.isAvailable.present ? data.isAvailable.value : this.isAvailable,
      marca: data.marca.present ? data.marca.value : this.marca,
      fechaIngreso: data.fechaIngreso.present
          ? data.fechaIngreso.value
          : this.fechaIngreso,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Product(')
          ..write('codigo: $codigo, ')
          ..write('nombre: $nombre, ')
          ..write('precio: $precio, ')
          ..write('existencias: $existencias, ')
          ..write('descripcion: $descripcion, ')
          ..write('isAvailable: $isAvailable, ')
          ..write('marca: $marca, ')
          ..write('fechaIngreso: $fechaIngreso')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(codigo, nombre, precio, existencias,
      descripcion, isAvailable, marca, fechaIngreso);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          other.codigo == this.codigo &&
          other.nombre == this.nombre &&
          other.precio == this.precio &&
          other.existencias == this.existencias &&
          other.descripcion == this.descripcion &&
          other.isAvailable == this.isAvailable &&
          other.marca == this.marca &&
          other.fechaIngreso == this.fechaIngreso);
}

class ProductsCompanion extends UpdateCompanion<Product> {
  final Value<int> codigo;
  final Value<String> nombre;
  final Value<double> precio;
  final Value<int> existencias;
  final Value<String> descripcion;
  final Value<int> isAvailable;
  final Value<String?> marca;
  final Value<DateTime?> fechaIngreso;
  const ProductsCompanion({
    this.codigo = const Value.absent(),
    this.nombre = const Value.absent(),
    this.precio = const Value.absent(),
    this.existencias = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.isAvailable = const Value.absent(),
    this.marca = const Value.absent(),
    this.fechaIngreso = const Value.absent(),
  });
  ProductsCompanion.insert({
    this.codigo = const Value.absent(),
    required String nombre,
    required double precio,
    required int existencias,
    required String descripcion,
    required int isAvailable,
    this.marca = const Value.absent(),
    this.fechaIngreso = const Value.absent(),
  })  : nombre = Value(nombre),
        precio = Value(precio),
        existencias = Value(existencias),
        descripcion = Value(descripcion),
        isAvailable = Value(isAvailable);
  static Insertable<Product> custom({
    Expression<int>? codigo,
    Expression<String>? nombre,
    Expression<double>? precio,
    Expression<int>? existencias,
    Expression<String>? descripcion,
    Expression<int>? isAvailable,
    Expression<String>? marca,
    Expression<DateTime>? fechaIngreso,
  }) {
    return RawValuesInsertable({
      if (codigo != null) 'codigo': codigo,
      if (nombre != null) 'nombre': nombre,
      if (precio != null) 'precio': precio,
      if (existencias != null) 'existencias': existencias,
      if (descripcion != null) 'descripcion': descripcion,
      if (isAvailable != null) 'is_available': isAvailable,
      if (marca != null) 'marca': marca,
      if (fechaIngreso != null) 'fecha_ingreso': fechaIngreso,
    });
  }

  ProductsCompanion copyWith(
      {Value<int>? codigo,
      Value<String>? nombre,
      Value<double>? precio,
      Value<int>? existencias,
      Value<String>? descripcion,
      Value<int>? isAvailable,
      Value<String?>? marca,
      Value<DateTime?>? fechaIngreso}) {
    return ProductsCompanion(
      codigo: codigo ?? this.codigo,
      nombre: nombre ?? this.nombre,
      precio: precio ?? this.precio,
      existencias: existencias ?? this.existencias,
      descripcion: descripcion ?? this.descripcion,
      isAvailable: isAvailable ?? this.isAvailable,
      marca: marca ?? this.marca,
      fechaIngreso: fechaIngreso ?? this.fechaIngreso,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (codigo.present) {
      map['codigo'] = Variable<int>(codigo.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (precio.present) {
      map['precio'] = Variable<double>(precio.value);
    }
    if (existencias.present) {
      map['existencias'] = Variable<int>(existencias.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    if (isAvailable.present) {
      map['is_available'] = Variable<int>(isAvailable.value);
    }
    if (marca.present) {
      map['marca'] = Variable<String>(marca.value);
    }
    if (fechaIngreso.present) {
      map['fecha_ingreso'] = Variable<DateTime>(fechaIngreso.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsCompanion(')
          ..write('codigo: $codigo, ')
          ..write('nombre: $nombre, ')
          ..write('precio: $precio, ')
          ..write('existencias: $existencias, ')
          ..write('descripcion: $descripcion, ')
          ..write('isAvailable: $isAvailable, ')
          ..write('marca: $marca, ')
          ..write('fechaIngreso: $fechaIngreso')
          ..write(')'))
        .toString();
  }
}

class $CategoryTable extends Category
    with TableInfo<$CategoryTable, CategoryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'categoria', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category';
  @override
  VerificationContext validateIntegrity(Insertable<CategoryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('categoria')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['categoria']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}categoria'])!,
    );
  }

  @override
  $CategoryTable createAlias(String alias) {
    return $CategoryTable(attachedDatabase, alias);
  }
}

class CategoryData extends DataClass implements Insertable<CategoryData> {
  final int id;
  final String description;
  const CategoryData({required this.id, required this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['categoria'] = Variable<String>(description);
    return map;
  }

  CategoryCompanion toCompanion(bool nullToAbsent) {
    return CategoryCompanion(
      id: Value(id),
      description: Value(description),
    );
  }

  factory CategoryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryData(
      id: serializer.fromJson<int>(json['id']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'description': serializer.toJson<String>(description),
    };
  }

  CategoryData copyWith({int? id, String? description}) => CategoryData(
        id: id ?? this.id,
        description: description ?? this.description,
      );
  CategoryData copyWithCompanion(CategoryCompanion data) {
    return CategoryData(
      id: data.id.present ? data.id.value : this.id,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryData(')
          ..write('id: $id, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryData &&
          other.id == this.id &&
          other.description == this.description);
}

class CategoryCompanion extends UpdateCompanion<CategoryData> {
  final Value<int> id;
  final Value<String> description;
  const CategoryCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
  });
  CategoryCompanion.insert({
    this.id = const Value.absent(),
    required String description,
  }) : description = Value(description);
  static Insertable<CategoryData> custom({
    Expression<int>? id,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'categoria': description,
    });
  }

  CategoryCompanion copyWith({Value<int>? id, Value<String>? description}) {
    return CategoryCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (description.present) {
      map['categoria'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryCompanion(')
          ..write('id: $id, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $CategoryProductTable extends CategoryProduct
    with TableInfo<$CategoryProductTable, CategoryProductData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoryProductTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES category (id)'));
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES products (codigo)'));
  @override
  List<GeneratedColumn> get $columns => [categoryId, productId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'category_product';
  @override
  VerificationContext validateIntegrity(
      Insertable<CategoryProductData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    } else if (isInserting) {
      context.missing(_categoryIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {productId, categoryId};
  @override
  CategoryProductData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoryProductData(
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
    );
  }

  @override
  $CategoryProductTable createAlias(String alias) {
    return $CategoryProductTable(attachedDatabase, alias);
  }
}

class CategoryProductData extends DataClass
    implements Insertable<CategoryProductData> {
  final int categoryId;
  final int productId;
  const CategoryProductData(
      {required this.categoryId, required this.productId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['category_id'] = Variable<int>(categoryId);
    map['product_id'] = Variable<int>(productId);
    return map;
  }

  CategoryProductCompanion toCompanion(bool nullToAbsent) {
    return CategoryProductCompanion(
      categoryId: Value(categoryId),
      productId: Value(productId),
    );
  }

  factory CategoryProductData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoryProductData(
      categoryId: serializer.fromJson<int>(json['categoryId']),
      productId: serializer.fromJson<int>(json['productId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'categoryId': serializer.toJson<int>(categoryId),
      'productId': serializer.toJson<int>(productId),
    };
  }

  CategoryProductData copyWith({int? categoryId, int? productId}) =>
      CategoryProductData(
        categoryId: categoryId ?? this.categoryId,
        productId: productId ?? this.productId,
      );
  CategoryProductData copyWithCompanion(CategoryProductCompanion data) {
    return CategoryProductData(
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      productId: data.productId.present ? data.productId.value : this.productId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoryProductData(')
          ..write('categoryId: $categoryId, ')
          ..write('productId: $productId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(categoryId, productId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoryProductData &&
          other.categoryId == this.categoryId &&
          other.productId == this.productId);
}

class CategoryProductCompanion extends UpdateCompanion<CategoryProductData> {
  final Value<int> categoryId;
  final Value<int> productId;
  final Value<int> rowid;
  const CategoryProductCompanion({
    this.categoryId = const Value.absent(),
    this.productId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoryProductCompanion.insert({
    required int categoryId,
    required int productId,
    this.rowid = const Value.absent(),
  })  : categoryId = Value(categoryId),
        productId = Value(productId);
  static Insertable<CategoryProductData> custom({
    Expression<int>? categoryId,
    Expression<int>? productId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (categoryId != null) 'category_id': categoryId,
      if (productId != null) 'product_id': productId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoryProductCompanion copyWith(
      {Value<int>? categoryId, Value<int>? productId, Value<int>? rowid}) {
    return CategoryProductCompanion(
      categoryId: categoryId ?? this.categoryId,
      productId: productId ?? this.productId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoryProductCompanion(')
          ..write('categoryId: $categoryId, ')
          ..write('productId: $productId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  $AppDbManager get managers => $AppDbManager(this);
  late final $ProductsTable products = $ProductsTable(this);
  late final $CategoryTable category = $CategoryTable(this);
  late final $CategoryProductTable categoryProduct =
      $CategoryProductTable(this);
  late final ProductDao productDao = ProductDao(this as AppDb);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [products, category, categoryProduct];
}

typedef $$ProductsTableCreateCompanionBuilder = ProductsCompanion Function({
  Value<int> codigo,
  required String nombre,
  required double precio,
  required int existencias,
  required String descripcion,
  required int isAvailable,
  Value<String?> marca,
  Value<DateTime?> fechaIngreso,
});
typedef $$ProductsTableUpdateCompanionBuilder = ProductsCompanion Function({
  Value<int> codigo,
  Value<String> nombre,
  Value<double> precio,
  Value<int> existencias,
  Value<String> descripcion,
  Value<int> isAvailable,
  Value<String?> marca,
  Value<DateTime?> fechaIngreso,
});

class $$ProductsTableTableManager extends RootTableManager<
    _$AppDb,
    $ProductsTable,
    Product,
    $$ProductsTableFilterComposer,
    $$ProductsTableOrderingComposer,
    $$ProductsTableCreateCompanionBuilder,
    $$ProductsTableUpdateCompanionBuilder> {
  $$ProductsTableTableManager(_$AppDb db, $ProductsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ProductsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ProductsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> codigo = const Value.absent(),
            Value<String> nombre = const Value.absent(),
            Value<double> precio = const Value.absent(),
            Value<int> existencias = const Value.absent(),
            Value<String> descripcion = const Value.absent(),
            Value<int> isAvailable = const Value.absent(),
            Value<String?> marca = const Value.absent(),
            Value<DateTime?> fechaIngreso = const Value.absent(),
          }) =>
              ProductsCompanion(
            codigo: codigo,
            nombre: nombre,
            precio: precio,
            existencias: existencias,
            descripcion: descripcion,
            isAvailable: isAvailable,
            marca: marca,
            fechaIngreso: fechaIngreso,
          ),
          createCompanionCallback: ({
            Value<int> codigo = const Value.absent(),
            required String nombre,
            required double precio,
            required int existencias,
            required String descripcion,
            required int isAvailable,
            Value<String?> marca = const Value.absent(),
            Value<DateTime?> fechaIngreso = const Value.absent(),
          }) =>
              ProductsCompanion.insert(
            codigo: codigo,
            nombre: nombre,
            precio: precio,
            existencias: existencias,
            descripcion: descripcion,
            isAvailable: isAvailable,
            marca: marca,
            fechaIngreso: fechaIngreso,
          ),
        ));
}

class $$ProductsTableFilterComposer
    extends FilterComposer<_$AppDb, $ProductsTable> {
  $$ProductsTableFilterComposer(super.$state);
  ColumnFilters<int> get codigo => $state.composableBuilder(
      column: $state.table.codigo,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get nombre => $state.composableBuilder(
      column: $state.table.nombre,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get precio => $state.composableBuilder(
      column: $state.table.precio,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get existencias => $state.composableBuilder(
      column: $state.table.existencias,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get descripcion => $state.composableBuilder(
      column: $state.table.descripcion,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get isAvailable => $state.composableBuilder(
      column: $state.table.isAvailable,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get marca => $state.composableBuilder(
      column: $state.table.marca,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get fechaIngreso => $state.composableBuilder(
      column: $state.table.fechaIngreso,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter categoryProductRefs(
      ComposableFilter Function($$CategoryProductTableFilterComposer f) f) {
    final $$CategoryProductTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.codigo,
            referencedTable: $state.db.categoryProduct,
            getReferencedColumn: (t) => t.productId,
            builder: (joinBuilder, parentComposers) =>
                $$CategoryProductTableFilterComposer(ComposerState($state.db,
                    $state.db.categoryProduct, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$ProductsTableOrderingComposer
    extends OrderingComposer<_$AppDb, $ProductsTable> {
  $$ProductsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get codigo => $state.composableBuilder(
      column: $state.table.codigo,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get nombre => $state.composableBuilder(
      column: $state.table.nombre,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get precio => $state.composableBuilder(
      column: $state.table.precio,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get existencias => $state.composableBuilder(
      column: $state.table.existencias,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get descripcion => $state.composableBuilder(
      column: $state.table.descripcion,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get isAvailable => $state.composableBuilder(
      column: $state.table.isAvailable,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get marca => $state.composableBuilder(
      column: $state.table.marca,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get fechaIngreso => $state.composableBuilder(
      column: $state.table.fechaIngreso,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$CategoryTableCreateCompanionBuilder = CategoryCompanion Function({
  Value<int> id,
  required String description,
});
typedef $$CategoryTableUpdateCompanionBuilder = CategoryCompanion Function({
  Value<int> id,
  Value<String> description,
});

class $$CategoryTableTableManager extends RootTableManager<
    _$AppDb,
    $CategoryTable,
    CategoryData,
    $$CategoryTableFilterComposer,
    $$CategoryTableOrderingComposer,
    $$CategoryTableCreateCompanionBuilder,
    $$CategoryTableUpdateCompanionBuilder> {
  $$CategoryTableTableManager(_$AppDb db, $CategoryTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$CategoryTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$CategoryTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> description = const Value.absent(),
          }) =>
              CategoryCompanion(
            id: id,
            description: description,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String description,
          }) =>
              CategoryCompanion.insert(
            id: id,
            description: description,
          ),
        ));
}

class $$CategoryTableFilterComposer
    extends FilterComposer<_$AppDb, $CategoryTable> {
  $$CategoryTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ComposableFilter categoryProductRefs(
      ComposableFilter Function($$CategoryProductTableFilterComposer f) f) {
    final $$CategoryProductTableFilterComposer composer =
        $state.composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $state.db.categoryProduct,
            getReferencedColumn: (t) => t.categoryId,
            builder: (joinBuilder, parentComposers) =>
                $$CategoryProductTableFilterComposer(ComposerState($state.db,
                    $state.db.categoryProduct, joinBuilder, parentComposers)));
    return f(composer);
  }
}

class $$CategoryTableOrderingComposer
    extends OrderingComposer<_$AppDb, $CategoryTable> {
  $$CategoryTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$CategoryProductTableCreateCompanionBuilder = CategoryProductCompanion
    Function({
  required int categoryId,
  required int productId,
  Value<int> rowid,
});
typedef $$CategoryProductTableUpdateCompanionBuilder = CategoryProductCompanion
    Function({
  Value<int> categoryId,
  Value<int> productId,
  Value<int> rowid,
});

class $$CategoryProductTableTableManager extends RootTableManager<
    _$AppDb,
    $CategoryProductTable,
    CategoryProductData,
    $$CategoryProductTableFilterComposer,
    $$CategoryProductTableOrderingComposer,
    $$CategoryProductTableCreateCompanionBuilder,
    $$CategoryProductTableUpdateCompanionBuilder> {
  $$CategoryProductTableTableManager(_$AppDb db, $CategoryProductTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$CategoryProductTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$CategoryProductTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> categoryId = const Value.absent(),
            Value<int> productId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CategoryProductCompanion(
            categoryId: categoryId,
            productId: productId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int categoryId,
            required int productId,
            Value<int> rowid = const Value.absent(),
          }) =>
              CategoryProductCompanion.insert(
            categoryId: categoryId,
            productId: productId,
            rowid: rowid,
          ),
        ));
}

class $$CategoryProductTableFilterComposer
    extends FilterComposer<_$AppDb, $CategoryProductTable> {
  $$CategoryProductTableFilterComposer(super.$state);
  $$CategoryTableFilterComposer get categoryId {
    final $$CategoryTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $state.db.category,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$CategoryTableFilterComposer(ComposerState(
                $state.db, $state.db.category, joinBuilder, parentComposers)));
    return composer;
  }

  $$ProductsTableFilterComposer get productId {
    final $$ProductsTableFilterComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $state.db.products,
        getReferencedColumn: (t) => t.codigo,
        builder: (joinBuilder, parentComposers) =>
            $$ProductsTableFilterComposer(ComposerState(
                $state.db, $state.db.products, joinBuilder, parentComposers)));
    return composer;
  }
}

class $$CategoryProductTableOrderingComposer
    extends OrderingComposer<_$AppDb, $CategoryProductTable> {
  $$CategoryProductTableOrderingComposer(super.$state);
  $$CategoryTableOrderingComposer get categoryId {
    final $$CategoryTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $state.db.category,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder, parentComposers) =>
            $$CategoryTableOrderingComposer(ComposerState(
                $state.db, $state.db.category, joinBuilder, parentComposers)));
    return composer;
  }

  $$ProductsTableOrderingComposer get productId {
    final $$ProductsTableOrderingComposer composer = $state.composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $state.db.products,
        getReferencedColumn: (t) => t.codigo,
        builder: (joinBuilder, parentComposers) =>
            $$ProductsTableOrderingComposer(ComposerState(
                $state.db, $state.db.products, joinBuilder, parentComposers)));
    return composer;
  }
}

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$ProductsTableTableManager get products =>
      $$ProductsTableTableManager(_db, _db.products);
  $$CategoryTableTableManager get category =>
      $$CategoryTableTableManager(_db, _db.category);
  $$CategoryProductTableTableManager get categoryProduct =>
      $$CategoryProductTableTableManager(_db, _db.categoryProduct);
}
