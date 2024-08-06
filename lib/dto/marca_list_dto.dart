class MarcaListDto{
  String marcaProducto;
  int totalProductos;

  MarcaListDto({
    required this.marcaProducto,
    required this.totalProductos});

  @override
  String toString() {
    return 'MarcaListDto{marcaProducto: $marcaProducto, totalProductos: $totalProductos}';
  }
}