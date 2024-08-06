class MarcaListDto {
  String marcaProducto;
  int totalProductosDisponibles;
  int totalProductosNoDisponibles;

  MarcaListDto({
    required this.marcaProducto,
    required this.totalProductosDisponibles,
    required this.totalProductosNoDisponibles,
  });
  @override
  String toString() {
    return 'MarcaListDto{marcaProducto: $marcaProducto, totalProductosDisponibles: $totalProductosDisponibles, totalProductosNoDisponibles: $totalProductosNoDisponibles}';
  }
}