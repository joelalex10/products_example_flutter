import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:productos/database/database.dart';
import 'package:productos/dto/product_dto.dart';
import 'package:productos/services/product_service.dart';
import 'package:productos/util/log.dart';
import 'package:provider/provider.dart';
class ProductsPage extends StatefulWidget {
  static const TAG = 'ProductsPage';

  final ProductDto product;

  ProductsPage({super.key, required this.product});

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late ProductService _productsService;
  late bool isAvailable;

  Future<void> _updateAvailability(bool value) async {
    Log.d(ProductsPage.TAG, 'Actualizando disponibilidad a: $value');
    try {
      await _productsService.updateAvailability(widget.product.codigoProducto, value ? 1 : 0)
          .then((value){
            setState(() {
              widget.product.isAvailable = value ? 1 : 0;
            });
            }
      );
      setState(() {
        isAvailable = value;
      });
      Log.i(ProductsPage.TAG, 'Disponibilidad actualizada a: $isAvailable');
    } catch (e) {
      Log.e(ProductsPage.TAG, 'Error actualizando disponibilidad: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    final db = Provider.of<AppDb>(context, listen: false);
    _productsService = ProductService(db.productDao);
    isAvailable = widget.product.isAvailable == 1;
    Log.i(ProductsPage.TAG, 'Estado inicializado con isAvailable: $isAvailable');
  }

  void _confirmChange(BuildContext context, bool newValue) {
    Log.d(ProductsPage.TAG, 'Confirmando cambio de disponibilidad a: $newValue');
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmación'),
          content: Text('¿Estás seguro de cambiar la disponibilidad?'),
          actions: [
            TextButton(
              onPressed: () {
                Log.i(ProductsPage.TAG, 'Usuario confirmó el cambio');
                Navigator.of(context).pop();
                _updateAvailability(newValue);
              },
              child: Text('Sí'),
            ),
            TextButton(
              onPressed: () {
                Log.i(ProductsPage.TAG, 'Usuario canceló el cambio');
                Navigator.of(context).pop();
              },
              child: Text('No'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[300],
      elevation: 4,
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${widget.product.nombre}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(
                      'Disponible',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: Checkbox(
                      value: isAvailable,
                      onChanged: (bool? value) {
                        if (value != null) {
                          Log.d(ProductsPage.TAG, 'Checkbox cambiado a: $value');
                          _confirmChange(context, value);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            _buildEditableRow(context, 'Código', '${widget.product.codigoProducto}'),
            SizedBox(height: 16),
            _buildEditableRow(context, 'Descripción', widget.product.descripcion),
            SizedBox(height: 16),
            _buildEditableRow(context, 'Precio', '\$${widget.product.precio}'),
            SizedBox(height: 16),
            _buildEditableRow(context, 'Existencias', '${widget.product.existencias}'),
            SizedBox(height: 16),
            _buildEditableRow(context, 'Fecha Ingreso',
                '${widget.product.fechaIngreso != null ? DateFormat('EEEE d \'de\' MMMM, yyyy', 'es').format(widget.product.fechaIngreso!) : 'N/A'}'),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableRow(BuildContext context, String field, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: ListTile(
            title: Text(
              field,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(value),
          ),
        ),
      ],
    );
  }
}