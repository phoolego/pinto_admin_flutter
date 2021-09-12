import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/service/auth.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _loading = false;
  _login() async {
    try{
      setState(() {
        _loading=true;
      });
      await Auth.login('admin1@mail', 'ad1234*');
      print(Auth.user.userId.toString());
    }catch(err){
      print(err);
    }
    setState(() {
      _loading=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: _loading?
      Center(
        child: Text('login loading...')
      ):
      Center(
        child: ElevatedButton(
          onPressed: ()async{
            await _login();
            Navigator.pushReplacementNamed(context,'/');
          },
          child: const Text('login'),
        ),
      ),
    );
  }
}
