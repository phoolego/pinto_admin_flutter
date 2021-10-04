import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/screen/auth/auth_controller.dart';
import 'package:pinto_admin_flutter/screen/auth/login.dart';
import 'package:pinto_admin_flutter/screen/homepage.dart';
import 'package:pinto_admin_flutter/screen/status_with_farmer.dart';
import 'package:pinto_admin_flutter/screen/stock_dashboard.dart';

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
        '/stock': (context) => const Homepage(),
        //'/stock/stockDashboard': (context) => StockDashboard(),
        //TODO-- FarmDetail,FarmSellingList page map route na nong Mine
        //'/stock/stockDashboard/farmDetail/' : (context) => FarmDetail(),
        //'/stock/stockDashboard/farmDetail/SellingList' : (context) => FarmSellingList(),
        '/stock/stockDashboard/farmDetail/SellingList/statusWithFarmer' : (context) => StatusWithFarmer(),
      },
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
