import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:productos/database/database.dart';
import 'package:productos/dto/product_dto.dart';
import 'package:productos/pages/insert_product_page.dart';
import 'package:productos/pages/tab_products_page.dart';
import 'package:productos/provider/product_notifier.dart';
import 'package:productos/router/routes.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final db = AppDb();
  db.enableForeignKeys();
  await initializeDateFormatting('es', null);
  final foreignKeys = await db.checkForeignKeys();

  print('Foreign keys enabled: $foreignKeys');
  runApp(
    MultiProvider(
      providers: [
        Provider<AppDb>(
          create: (_) => db,
          child: MyApp(),
        ),
        ChangeNotifierProvider(
            create: (_) => ProductNotifier(ProductDto(
                precio: 0,
                nombre: "",
                existencias: 0,
                descripcion: "",
                codigoProducto: 0,
                isAvailable: 0,
                fechaIngreso: null))), // Inicializa con el producto adecuado
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.initialRoute,
    );
  }
}
