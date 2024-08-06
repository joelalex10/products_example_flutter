import 'package:flutter/material.dart';
import 'package:productos/database/database.dart';
import 'package:productos/dto/product_dto.dart';
import 'package:productos/services/insert_products_service.dart';
import 'package:provider/provider.dart';

class InsertProductPage extends StatefulWidget {
  const InsertProductPage({super.key});

  @override
  State<InsertProductPage> createState() => _InsertProductPageState();
}

class _InsertProductPageState extends State<InsertProductPage> {
  late InsertProductsService _insertProductsService;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _codigoController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();
  final TextEditingController _existenciasController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  DateTime? _fechaIngreso;

  @override
  void initState() {
    super.initState();
    final db = Provider.of<AppDb>(context, listen: false);
    _insertProductsService = InsertProductsService(db.productDao);
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (bool didPop) {
        if(didPop) return;
        goToTabPage();
      },
      child: Scaffold(
        appBar: AppBar(title: Text('Adicion de producto')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _codigoController,
                  decoration: InputDecoration(labelText: 'Código'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa el código';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _nombreController,
                  decoration: InputDecoration(labelText: 'Nombre'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa el nombre';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _precioController,
                  decoration: InputDecoration(labelText: 'Precio'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa el precio';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _existenciasController,
                  decoration: InputDecoration(labelText: 'Existencias'),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa las existencias';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _descripcionController,
                  decoration: InputDecoration(labelText: 'Descripción'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa la descripción';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Agregar Producto'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      try{
        final codigo = int.parse(_codigoController.text);
        final nombre = _nombreController.text;
        final precio = double.parse(_precioController.text);
        final existencias = int.parse(_existenciasController.text);
        final descripcion = _descripcionController.text;
        final product = ProductDto(
            codigoProducto: codigo,
            descripcion: descripcion,
            existencias: existencias,
            fechaIngreso: DateTime.now(),
            nombre: nombre,
            precio: precio,

        );
        await _insertProductsService.addProductToDatabase(product);
        _showAlertDialog(context, "EXITO", "Se ha registrado el producto de manera exitosa",Colors.green, goToTabPage);
      }catch(e){
        if(e.toString().contains('UNIQUE constraint failed')){
          print("HA OCURRIDO UN ERROR: $e");
          _showAlertDialog(context, "ERROR", "El codigo ya fue registrado anteriormente",Colors.red, onError);
        }else{
          print("HA OCURRIDO UN ERROR: $e");
          _showAlertDialog(context, "ERROR", "No se puedo registrar el producto",Colors.red, onError);
        }
      }
    }
  }

  void goToTabPage() {
    Navigator.of(context).pop();
    print('INVOCANDO METODO DE RETORNO');
    Navigator.pop(context, 'reload');
  }
  void onError() {
    Navigator.of(context).pop();
  }
  Future<void> _showAlertDialog(BuildContext context, String title, String textContent, Color color, void Function() funcion) async {
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {
        funcion();
      },
    );

    // Configura el diálogo
    AlertDialog alert = AlertDialog(
      title: Text(title, style: TextStyle(fontSize: 20.0),),
      content: Text(textContent),
      actions: [
        okButton,
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      contentTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
    );
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


}
