import 'package:flutter/material.dart';
import 'package:productos/database/database.dart';
import 'package:productos/dto/product_dto.dart';
import 'package:productos/pages/products_page.dart';
import 'package:productos/services/tab_products_service.dart';
import 'package:productos/util/log.dart';
import 'package:provider/provider.dart';

class TabProductsPage extends StatefulWidget {
  static const TAG = 'TabProductsPage';
  const TabProductsPage({super.key});

  @override
  State<TabProductsPage> createState() => _TabProductsPageState();
}

class _TabProductsPageState extends State<TabProductsPage> {
  late TabProductsService _productsService;
  late Future<List<ProductDto>> _productsFuture;

  @override
  void initState() {
    super.initState();
    final db = Provider.of<AppDb>(context, listen: false);
    _productsService = TabProductsService(db.productDao);
    _productsFuture = _fetchProducts();
    _initializeState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Log.d(TabProductsPage.TAG,'Se va a recargar los datos');
    _productsFuture = _fetchProducts();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gestión de productos',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: FutureBuilder<List<ProductDto>>(
        future: _productsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting &&
              snapshot.data == null) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print('Error: ${snapshot.error}');
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No se registraron productos'));
          } else {
            final products = snapshot.data!;
            int count = 0;
            return DefaultTabController(
              length: products.length,
              child: Column(
                children: [
                  TabBar(
                    indicatorColor: Color(0xFF3F51B5),
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.tab,
                    labelPadding: EdgeInsets.symmetric(horizontal: 30.0),
                    tabs: products.map((consumer) {
                      count++;
                      return Tab(
                        child: Text(
                          '$count',
                          style: TextStyle(
                            color: _getTabTextColor(consumer),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  Expanded(
                    child: TabBarView(
                      children: products.map((product) {
                        return SingleChildScrollView(
                          child: ProductsPage(product: product),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result =
              await _productsService.navigateInsertProductPage(context);
          if (result == 'reload') {
            print("RECARGANDO LISTA DE PRODUCTOS");
            setState(() {
              _productsFuture = _fetchProducts();
            });
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<List<ProductDto>> _fetchProducts() async {
    return await _productsService.getAllProducts();
  }

  void _initializeState() {
    print("OBTENIENDO INFORMACION DE PRODUCTOS");
    final db = Provider.of<AppDb>(context, listen: false);
    _productsService = TabProductsService(db.productDao);
    _productsFuture = _fetchProducts();
  }

  Color _getTabTextColor(ProductDto product) {
    return product.isAvailable == 0 ? Colors.red : Colors.black;
  }
}
