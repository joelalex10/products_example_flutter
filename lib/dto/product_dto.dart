class ProductDto {
  int codigoProducto;
  String nombre;
  double precio;
  int existencias;
  String descripcion;
  int? isAvailable;
  DateTime? fechaIngreso;

  ProductDto({required this.codigoProducto, required this.nombre, required this.precio,
      required this.existencias, required this.descripcion, this.fechaIngreso, this.isAvailable});

}
