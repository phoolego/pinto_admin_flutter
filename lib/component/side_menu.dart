
import 'package:flutter/material.dart';
import 'package:pinto_admin_flutter/constant.dart';
// import 'package:pinto_farmer_flutter/screen/farmer_product_sale_Page.dart';
import 'package:pinto_admin_flutter/service/auth.dart';

class SideMenu extends StatelessWidget {

String? firstName = '';
String? lastName = '';
String? role = '';

SideMenu.withoutAny(){
  this.firstName = 'Firstname';
  this.lastName = 'Lastname';
  this.role = 'Role';
}
SideMenu({this.firstName, this.lastName, this.role});



  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: 100,
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Container(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 10),
                      width: 80,
                      height: 80,
                      child: Image.asset('assets/images/Demo.png'),
                    ),
                    Text(
                      '$firstName \n$lastName \n$role',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.white10,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: (){
                //Navigator.pop(context);
                print('Home');
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Cart'),
              onTap: (){
                Navigator.pop(context);
                //Navigator.pop it will just close side menu
                print('cart');
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('sale product (testing)'),
              onTap: (){
                Navigator.pushNamed(context, '/product/sale',);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: ()async {
                await Auth.logout();
                Navigator.pushReplacementNamed(context,'/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
