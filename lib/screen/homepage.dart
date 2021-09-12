import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/service/auth.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await Auth.logout();
            Navigator.pushReplacementNamed(context,'/');
          },
          child: const Text('logout'),
        ),
      ),
    );
  }
}
