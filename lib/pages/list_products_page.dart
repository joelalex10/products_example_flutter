import 'package:flutter/material.dart';
import 'package:productos/database/database.dart';
import 'package:productos/dto/marca_list_dto.dart';
import 'package:productos/services/list_products_service.dart';
import 'package:productos/util/log.dart';
import 'package:provider/provider.dart';

class ListProductsPage extends StatefulWidget {
  static const String TAG = "ListProductsPage";
  const ListProductsPage({super.key});

  @override
  State<ListProductsPage> createState() => _ListProductsPageState();
}

class _ListProductsPageState extends State<ListProductsPage> {

  final TextEditingController _searchController = TextEditingController();
  late Future<List<MarcaListDto>> _marcasFuture;
  late ListProductsService _listProductsService;
  @override
  void initState() {
    final db = Provider.of<AppDb>(context, listen: false);
    _listProductsService = ListProductsService(db.productDao);
    _initializeState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de Productos por marca',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Buscar por marca',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
              child: FutureBuilder<List<MarcaListDto>>(
                future: _marcasFuture,
                builder: (context, snapshot){
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No hay datos disponibles'));
                  } else {
                    List<MarcaListDto> result = snapshot.data!;
                    return ListView.builder(
                      itemCount: result.length,
                        itemBuilder: (context, index){
                          final marca = result[index];
                          return Card(
                            color: Colors.grey[300],
                            child: ListTile(
                              /**title: Center(
                                child: Text(marca.marcaProducto),
                              ),*/
                              title: Text(marca.marcaProducto, style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Productos registrados: ${marca.totalProductos}',

                                  ),
                                ],
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.arrow_forward_outlined),
                                onPressed: () async {
                                  await goToTabPage(marca.marcaProducto);
                                },
                              ),
                            ),
                          );
                        }
                    );
                  }
                },
              )
          ),
        ],
      ),
    );
  }

  void _initializeState() {
    _marcasFuture = _fetchMarcas();
  }
  Future<List<MarcaListDto>> _fetchMarcas() async {
    final query = _searchController.text.toLowerCase();
    if (query.isEmpty) {
      return await _listProductsService.getTotalProductsByBrand();
    } else {
      return await _listProductsService.getTotalProductsByBrand();;
    }
  }

  Future<void> goToTabPage(String marcaProducto) async {
    await Navigator.pushNamed(context, '/tab_list_products',
      arguments: {
        'marca': marcaProducto,
      },
    );
  }
}
