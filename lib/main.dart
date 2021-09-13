import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/screen/auth/auth_controller.dart';
import 'package:pinto_admin_flutter/screen/auth/login.dart';

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
      },
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
