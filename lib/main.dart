import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/screen/admin_add_product.dart';
import 'package:pinto_admin_flutter/screen/auth/auth_controller.dart';
import 'package:pinto_admin_flutter/screen/auth/login.dart';
import 'package:pinto_admin_flutter/screen/stock_list_page.dart';
import 'package:pinto_admin_flutter/screen/my_profile_page.dart';
import 'package:pinto_admin_flutter/screen/product_price_table_page.dart';
import 'package:pinto_admin_flutter/screen/manage_farmer_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pinto Admin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AuthController(),
        '/login': (context) => const Login(),
        '/stock': (context) =>  StockListPage(),
        '/profile': (context) => MyProfilePage(),
        //'/stock/stockDashboard': (context) => StockDashboard(),
        //TODO-- FarmDetail,FarmSellingList page map route na nong Mine
        // '/stock/stockDashboard/farmDetail/' : (context) => FarmProductPage(),
        // '/stock/stockDashboard/farmDetail/SellingList' : (context) => sellingProductListPage(),
        // '/stock/stockDashboard/farmDetail/SellingList/statusWithFarmer' : (context) => SellingProductStatusPage(),
        '/stock/productPriceTable' : (context) => ProductPriceTable(),
        '/manageFarmer' : (context) => ManageFarmerPage(),
        '/stock/productPriceTable/addProduct' : (context) => AdminAddProductPage(),
      },
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
