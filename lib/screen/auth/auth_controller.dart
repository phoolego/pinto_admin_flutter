import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/model/user.dart';
import 'package:pinto_admin_flutter/screen/auth/login.dart';
import 'package:pinto_admin_flutter/screen/stock_list_page.dart';
import 'package:pinto_admin_flutter/service/auth.dart';

class AuthController extends StatefulWidget {
  const AuthController({Key? key}) : super(key: key);

  @override
  _AuthControllerState createState() => _AuthControllerState();
}

class _AuthControllerState extends State<AuthController> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
      future: Auth.getLoginUser(),
      builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          User? user = snapshot.data;
          if(user!.userId==0){
            return const Login();
          }else{
            return const StockListPage();
          }
        }
      },
    );
  }
}
