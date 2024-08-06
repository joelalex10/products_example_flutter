import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:productos/database/database.dart';
import 'package:productos/dto/product_dto.dart';
import 'package:productos/pages/insert_product_page.dart';
import 'package:productos/pages/tab_products_page.dart';
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
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.indigo, // Cambia esto al color que desees
          foregroundColor: Colors.white, // Cambia esto al color del texto/iconos que desees
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.initialRoute,
    );
  }
}
